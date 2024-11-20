#! /usr/bin/env python3

#%% User input
'''
ymd = '20240115'

rtofs_archv_file = '/work/noaa/hwrf/noscrub/maristiz/RTOFS/rtofs.20240115/rtofs_glo.t00z.f06.archv.test2.a'

rtofs_grid_file = '/work/noaa/hwrf/noscrub/maristiz/RTOFS_fix/GRID_DEPTH_global/regional.grid.a'

ncoda_2dvar_file = '/work/noaa/hwrf/noscrub/maristiz/RTOFS/rtofs.20240115/seatmp_sfc_1o4500x3298_2024041506_0000_analfld'

var_name = 'temp'
'''

#########################################################################
import argparse
import numpy as np
import numpy.ma as ma
import struct

#########################################################################
if __name__ == "__main__":
    # get command line args
    parser = argparse.ArgumentParser(
        description="Copy the SST from the 2DVAR NCODA analysis onto the corresponding RTOFS archv file")
    parser.add_argument('ymd', type=str, help="RTOFS daily cycle. Ex: 20240115")
    parser.add_argument('rtofs_archv_file', type=str, help="Full path and name of the RTOFS archv file")
    parser.add_argument('rtofs_grid_file', type=str, help="Full path and name of the RTOFS grid file")
    parser.add_argument('ncoda_2dvar_file', type=str, help="Full path and name of the NCODA 2DVAR file that contains the SST or the SSS fields")
    parser.add_argument('var_name', type=str, help="Variable name in the RTOFS archv.b file that will copied to the RTOFS archv.a file")

    args = parser.parse_args()

    ymd = args.ymd
    rtofs_archv_file = args.rtofs_archv_file
    rtofs_grid_file = args.rtofs_grid_file
    ncoda_2dvar_file = args.ncoda_2dvar_file
    var_name = args.var_name

    #########################################################################
    #%% Reading HYCOM grid from ab files
    print('Retrieving coordinates from RTOFS')
    # Reading lat and lon
    lines_grid = [line.rstrip() for line in open(rtofs_grid_file[:-2]+'.b')]
    idm = int([line.split() for line in lines_grid if 'idm' in line][0][0])
    jdm = int([line.split() for line in lines_grid if 'jdm' in line][0][0])

    #########################################################################
    print('Reading ab files')
    
    rtofs_file = rtofs_archv_file[:-2] 
    
    lines = [line.rstrip() for line in open(rtofs_file+'.b')]
    ijdm = idm*jdm
    npad = 4096-(ijdm%4096)
    fld = ma.array([],fill_value=1.2676506002282294e+30)
    
    inFile_a = rtofs_file + '.a'
    
    for n,line in enumerate(lines):
        if len(line) > 0:
            if line.split()[0] == 'field':
                nheading = n + 1
                print(line.split()[0])

    klayer = '1'
    for n,line in enumerate(lines):
        if len(line) > 0:
            if line.split()[0] == var_name and line.split()[4] == klayer:
                nvar = n - nheading
                print(nvar)
                print(n)

    fid = open(inFile_a,'rb')
    fid.seek((nvar)*4*(npad+ijdm),0)
    fld = fid.read(ijdm*4)
    fld = struct.unpack('>'+str(ijdm)+'f',fld)
    fld = np.array(fld)
    fld_archv = ma.reshape(fld,(jdm,idm))
    
    maxval_raw_archv = np.nanmax(fld_archv)
    minval_raw_archv = np.nanmin(fld_archv)
    print('from raw archv file ',maxval_raw_archv)
    print('from raw archv file ',minval_raw_archv)
    
    fld2_archv = np.copy(fld_archv)
    mask = fld2_archv > 10**5
    fld2_archv[mask] = np.nan
    
    maxval_archv = np.nanmax(fld2_archv)
    minval_archv = np.nanmin(fld2_archv)
    print('from archv file ',maxval_archv)
    print('from archv file ',minval_archv)
    
    #########################################################################
    # Read ncoda 2DVAR file
    binary_file_ncoda = open(ncoda_2dvar_file,'rb')
    binary_file_ncoda.seek(0)
    fld_ncoda = binary_file_ncoda.read(ijdm*4)
    fld_ncoda_unpack = struct.unpack('>'+str(ijdm)+'f',fld_ncoda)
    fld_ncoda_array = np.array(fld_ncoda_unpack)
    fld_ncoda_reshape = ma.reshape(fld_ncoda_array,(jdm,idm))
    
    fld_ncoda_array_new_fill_value = np.copy(fld_ncoda_array)
    mask = fld_ncoda_array_new_fill_value < -100
    fld_ncoda_array_new_fill_value[mask] = 1.2676506002282294e+30
    fld_ncoda_array_new_fill_value_reshape = ma.reshape(fld_ncoda_array_new_fill_value,(jdm,idm))
    fld_ncoda_array_new_fill_value_byt = [struct.pack('>f',value) for value in fld_ncoda_array_new_fill_value]
    fld_ncoda_array_new_fill_value_bytes = b''.join(fld_ncoda_array_new_fill_value_byt)
    
    fld2_ncoda = np.copy(fld_ncoda_reshape)
    mask = fld2_ncoda < -100
    fld2_ncoda[mask] = np.nan

    maxval_ncoda = np.nanmax(fld2_ncoda)
    minval_ncoda = np.nanmin(fld2_ncoda)
    print('from ncoda file ',maxval_ncoda)
    print('from ncoda file ',minval_ncoda)
    
    #########################################################################
    # Replace value in bynary a file
    binary_file = open(inFile_a,'r+b')
    binary_file.seek((nvar)*4*(npad+ijdm))
    binary_file.write(fld_ncoda_array_new_fill_value_bytes)
    binary_file.close()
    
    #########################################################################
    # Replace max and min value for temp at surface layer in b file
    inFile_b = rtofs_file + '.b'
    bfile = open(inFile_b,'r+')
    
    linesb = open(inFile_b,'r+').readlines()
    
    for n,line in enumerate(linesb):
        if len(line) > 0 and line != '\n':
            if line.split()[0] == var_name and line.split()[4] == klayer:
                print(n)
                linesb[n] =  line[0:44] + '{:.7E}'.format(minval_ncoda) + '   ' + '{:.7E}'.format(maxval_ncoda) + '\n'

    bfile.writelines(linesb)
    bfile.close()
    
    #########################################################################
    # Check SST in archv file was modified
    binary_file = open(inFile_a,'rb')
    binary_file.seek((nvar)*4*(npad+ijdm))
    fld = binary_file.read(ijdm*4)
    fld_unpack = struct.unpack('>'+str(ijdm)+'f',fld)
    fld_array = np.array(fld_unpack)
    fld_modified_archv = ma.reshape(fld_array,(jdm,idm))
    
    fld2_modified_archv = np.copy(fld_modified_archv)
    mask = fld2_modified_archv > 10**5
    fld2_modified_archv[mask] = np.nan
    
    print('From modified archv file ',np.nanmax(fld_modified_archv))
    print('From modified archv file ',np.nanmin(fld_modified_archv))

