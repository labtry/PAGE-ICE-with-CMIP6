; Below is an NCL script example for processing CMIP6 data.
; This code calculates temperature variations based on eight world regions.

load "./shapefile_utils.ncl"
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

    do i = 0,12,1
        input =  "/home/liuab/lonFlip/SSP119/tas_"+ESMs_119(i)+"_ssp119_2015-2100.nc"
        output =  "/home/liuab/Regional/SSP119/tas_"+ESMs_119(i)+"_ssp119_2015-2100.nc"
        f1 = addfile (input,"r")
        fout1 = addfile (output,"c")
        print(input)
        
        WRITE_MASK = True
        DEBUG      = False
        tas_LA=f1->tas
        tas_CA=f1->tas
        tas_IA=f1->tas
        tas_AF=f1->tas
        tas_EE=f1->tas
        tas_OT=f1->tas
        tas_EU=f1->tas
        tas_US=f1->tas
        tas_Land=f1->tas
        
        opt             = True
        opt@return_mask = True
        shpfile   = "/home/liuab/shp/LA.shp"
        nnum= dimsizes(f1->tas(:,0,0))
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_LA(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask)
        
        shpfile   = "/home/liuab/shp/CA.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_CA(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/IA.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_IA(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/AF.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_AF(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/EE.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_EE(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/OT.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_OT(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/EU.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_EU(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/US.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_US(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        shpfile   = "/home/liuab/shp/Land.shp"
        do j = 0, nnum-1
            a1 = f1->tas(j,:,:)
            land_mask = shapefile_mask_data(a1,shpfile,opt)
            u_land_mask  = where(land_mask.eq.1,a1,f1->tas@_FillValue)
            tas_Land(j,:,:)=u_land_mask*1.0
        end do
        delete(land_mask)
        delete(u_land_mask) 
        
        lat=f1->lat
        lon=f1->lon
        jlat=dimsizes(lat)
        rad=4.0*atan(1.0)/180.0
        re=6371220.0
        rr=re*rad
        dlon=abs(lon(2)-lon(1))*rr
        dx=dlon*cos(lat*rad)
        dy=new(jlat,typeof(dx))
        dy(0)=abs(lat(2)-lat(1))*rr
        dy(1:jlat-2)=abs(lat(2:jlat-1)-lat(0:jlat-3))*rr*0.5
        dy(jlat-1)=abs(lat(jlat-1)-lat(jlat-2))*rr
        area=dx*dy
        
        Stat=new((/86,10/),"float")
        Stat(:,0)=(/wgt_areaave_Wrap(f1->tas,area,1.0,1)/)
        Stat(:,1)=(/wgt_areaave_Wrap(tas_LA,area,1.0,1)/)
        Stat(:,2)=(/wgt_areaave_Wrap(tas_CA,area,1.0,1)/)
        Stat(:,3)=(/wgt_areaave_Wrap(tas_IA,area,1.0,1)/)
        Stat(:,4)=(/wgt_areaave_Wrap(tas_AF,area,1.0,1)/)
        Stat(:,5)=(/wgt_areaave_Wrap(tas_EE,area,1.0,1)/)
        Stat(:,6)=(/wgt_areaave_Wrap(tas_OT,area,1.0,1)/)
        Stat(:,7)=(/wgt_areaave_Wrap(tas_EU,area,1.0,1)/)
        Stat(:,8)=(/wgt_areaave_Wrap(tas_US,area,1.0,1)/)
        Stat(:,9)=(/wgt_areaave_Wrap(tas_Land,area,1.0,1)/)
        delete(area)
        delete(lat)
        delete(lon)
        delete(dx)
        delete(dy)
        
        fout1->Stat=Stat
        delete(tas_LA)
        delete(tas_CA)
        delete(tas_IA)
        delete(tas_AF)
        delete(tas_EE)
        delete(tas_OT)
        delete(tas_EU)
        delete(tas_US)
        delete(tas_Land)
		delete(a1)
		
    end do


end