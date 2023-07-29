; Below is an NCL script example for processing CMIP6 data.
; This code is used to flip the longitude of the data.
; This operation is performed to facilitate subsequent region-based clipping and statistical analysis.

begin
ESMs_126=(/"ACCESS-CM2","ACCESS-ESM1-5","AWI-CM-1-1-MR","BCC-CSM2-MR","CAMS-CSM1-0","CanESM5","CanESM5-CanOE","CAS-ESM2-0","CESM2","CESM2-WACCM","CIESM","CMCC-CM2-SR5","CMCC-ESM2","CNRM-CM6-1","CNRM-CM6-1-HR","CNRM-ESM2-1","EC-Earth3","EC-Earth3-Veg","EC-Earth3-Veg-LR","FGOALS-f3-L","FGOALS-g3","FIO-ESM-2-0","GISS-E2-1-G","HadGEM3-GC31-LL","HadGEM3-GC31-MM","IITM-ESM","INM-CM4-8","INM-CM5-0","IPSL-CM5A2-INCA","IPSL-CM6A-LR","KACE-1-0-G","KIOST-ESM","MCM-UA-1-0","MIROC-ES2L","MIROC6","MPI-ESM1-2-HR","MPI-ESM1-2-LR","MRI-ESM2-0","NESM3","NorESM2-LM","NorESM2-MM","TaiESM1","UKESM1-0-LL"/)
ESMs_245=(/"ACCESS-CM2","ACCESS-ESM1-5","AWI-CM-1-1-MR","BCC-CSM2-MR","CAMS-CSM1-0","CanESM5","CanESM5-CanOE","CAS-ESM2-0","CESM2","CESM2-WACCM","CIESM","CMCC-CM2-SR5","CMCC-ESM2","CNRM-CM6-1","CNRM-CM6-1-HR","CNRM-ESM2-1","EC-Earth3","EC-Earth3-CC","EC-Earth3-Veg","EC-Earth3-Veg-LR","FGOALS-f3-L","FGOALS-g3","FIO-ESM-2-0","GISS-E2-1-G","HadGEM3-GC31-LL","IITM-ESM","INM-CM4-8","INM-CM5-0","IPSL-CM6A-LR","KACE-1-0-G","KIOST-ESM","MCM-UA-1-0","MIROC-ES2L","MIROC6","MPI-ESM1-2-HR","MPI-ESM1-2-LR","MRI-ESM2-0","NESM3","NorESM2-LM","NorESM2-MM","TaiESM1","UKESM1-0-LL"/)
ESMs_370=(/"ACCESS-CM2","ACCESS-ESM1-5","AWI-CM-1-1-MR","BCC-CSM2-MR","CAMS-CSM1-0","CanESM5","CanESM5-CanOE","CAS-ESM2-0","CESM2","CESM2-WACCM","CMCC-CM2-SR5","CMCC-ESM2","CNRM-CM6-1","CNRM-CM6-1-HR","CNRM-ESM2-1","EC-Earth3","EC-Earth3-AerChem","EC-Earth3-Veg","EC-Earth3-Veg-LR","FGOALS-f3-L","FGOALS-g3","GISS-E2-1-G","IITM-ESM","INM-CM4-8","INM-CM5-0","IPSL-CM5A2-INCA","IPSL-CM6A-LR","KACE-1-0-G","MCM-UA-1-0","MIROC-ES2L","MIROC6","MPI-ESM-1-2-HAM","MPI-ESM1-2-HR","MPI-ESM1-2-LR","MRI-ESM2-0","NorESM2-LM","NorESM2-MM","TaiESM1","UKESM1-0-LL"/)
ESMs_585=(/"ACCESS-CM2","ACCESS-ESM1-5","AWI-CM-1-1-MR","BCC-CSM2-MR","CAMS-CSM1-0","CanESM5","CanESM5-CanOE","CAS-ESM2-0","CESM2","CESM2-WACCM","CIESM","CMCC-CM2-SR5","CMCC-ESM2","CNRM-CM6-1","CNRM-CM6-1-HR","CNRM-ESM2-1","E3SM-1-1","EC-Earth3","EC-Earth3-CC","EC-Earth3-Veg","EC-Earth3-Veg-LR","FGOALS-f3-L","FGOALS-g3","FIO-ESM-2-0","GISS-E2-1-G","HadGEM3-GC31-LL","HadGEM3-GC31-MM","IITM-ESM","INM-CM4-8","INM-CM5-0","IPSL-CM6A-LR","KACE-1-0-G","KIOST-ESM","MCM-UA-1-0","MIROC-ES2L","MIROC6","MPI-ESM1-2-HR","MPI-ESM1-2-LR","MRI-ESM2-0","NESM3","NorESM2-LM","NorESM2-MM","TaiESM1","UKESM1-0-LL"/)
ESMs_119=(/"CAMS-CSM1-0","CanESM5","CNRM-ESM2-1","EC-Earth3","EC-Earth3-Veg","EC-Earth3-Veg-LR","FGOALS-g3","GISS-E2-1-G","IPSL-CM6A-LR","MIROC-ES2L","MIROC6","MRI-ESM2-0","UKESM1-0-LL"/)
ESMs_434=(/"CanESM5","CNRM-ESM2-1","EC-Earth3","FGOALS-g3","GISS-E2-1-G","IPSL-CM6A-LR","MIROC6","MRI-ESM2-0","UKESM1-0-LL"/)
ESMs_534=(/"CanESM5","CNRM-ESM2-1","EC-Earth3","FGOALS-g3","GISS-E2-1-G","IPSL-CM6A-LR","MIROC6","MRI-ESM2-0","UKESM1-0-LL","MIROC-ES2L","CESM2-WACCM","CMCC-ESM2"/)
ESMs_460=(/"CanESM5","CNRM-ESM2-1","FGOALS-g3","GISS-E2-1-G","IPSL-CM6A-LR","MIROC6","MRI-ESM2-0"/)
ESMs_G6=(/"CNRM-ESM2-1","IPSL-CM6A-LR","UKESM1-0-LL","CESM2-WACCM","MPI-ESM1-2-HR","MPI-ESM1-2-LR"/)


do i = 0,42,1
    input =  "F:/Annual/SSP126/tas_"+ESMs_126(i)+"_ssp126_2015-2100.nc"
    output =  "F:/lonFlip/SSP126/tas_"+ESMs_126(i)+"_ssp126_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   ;CESM2加了这个限制。要更改。
    fout1->lon@valid_max=180.
end do


do i = 0,41,1
    input =  "F:/Annual/SSP245/tas_"+ESMs_245(i)+"_ssp245_2015-2100.nc"
    output =  "F:/lonFlip/SSP245/tas_"+ESMs_245(i)+"_ssp245_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,38,1
    input =  "F:/Annual/SSP370/tas_"+ESMs_370(i)+"_ssp370_2015-2100.nc"
    output =  "F:/lonFlip/SSP370/tas_"+ESMs_370(i)+"_ssp370_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do


do i = 0,43,1
    input =  "F:/Annual/SSP585/tas_"+ESMs_585(i)+"_ssp585_2015-2100.nc"
    output =  "F:/lonFlip/SSP585/tas_"+ESMs_585(i)+"_ssp585_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,12,1
    input =  "F:/Annual/SSP119/tas_"+ESMs_119(i)+"_ssp119_2015-2100.nc"
    output =  "F:/lonFlip/SSP119/tas_"+ESMs_119(i)+"_ssp119_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,8,1
    input =  "F:/Annual/SSP434/tas_"+ESMs_434(i)+"_ssp434_2015-2100.nc"
    output =  "F:/lonFlip/SSP434/tas_"+ESMs_434(i)+"_ssp434_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do


do i = 0,11,1
    input =  "F:/Annual/SSP534-over/tas_"+ESMs_534(i)+"_ssp534-over_2015-2100.nc"
    output =  "F:/lonFlip/SSP534-over/tas_"+ESMs_534(i)+"_ssp534-over_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,6,1
    input =  "F:/Annual/SSP460/tas_"+ESMs_460(i)+"_ssp460_2015-2100.nc"
    output =  "F:/lonFlip/SSP460/tas_"+ESMs_460(i)+"_ssp460_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,5,1
    input =  "F:/Annual/G6solar/tas_"+ESMs_G6(i)+"_G6solar_2015-2100.nc"
    output =  "F:/lonFlip/G6solar/tas_"+ESMs_G6(i)+"_G6solar_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

do i = 0,5,1
    input =  "F:/Annual/G6sulfur/tas_"+ESMs_G6(i)+"_G6sulfur_2015-2100.nc"
    output =  "F:/lonFlip/G6sulfur/tas_"+ESMs_G6(i)+"_G6sulfur_2015-2100.nc"
    f1 = addfile (input,"r")
    fout1 = addfile (output,"c")
    fout1->tas=lonFlip(f1->tas)
    print(input)
    fout1->lon@valid_min=-180.   
    fout1->lon@valid_max=180.
end do

end