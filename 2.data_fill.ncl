; Below is an NCL script example for processing CMIP6 data.
; This code is used to address missing data in some CMIP6 datasets.
; Missing values are filled using data from the last year.

begin 

    f1 = addfile ("F:/datafill/2099/tas_CAMS-CSM1-0_ssp119_2015-2099.nc","r")
    f2 = addfile ("F:/datafill/2099/tas_CAMS-CSM1-0_ssp126_2015-2099.nc","r")
    f3 = addfile ("F:/datafill/2099/tas_CAMS-CSM1-0_ssp245_2015-2099.nc","r")
    f4 = addfile ("F:/datafill/2099/tas_CAMS-CSM1-0_ssp370_2015-2099.nc","r")
    f5 = addfile ("F:/datafill/2099/tas_CAMS-CSM1-0_ssp585_2015-2099.nc","r")
    
    f6 = addfile ("F:/datafill/2099/tas_IITM-ESM_ssp245_2015-2099.nc","r")
    f7 = addfile ("F:/datafill/2099/tas_IITM-ESM_ssp585_2015-2099.nc","r")
    
    f8 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-HR_G6solar_2015-2099.nc","r")
    f9 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-HR_G6sulfur_2020-2099.nc","r")
    f10 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-LR_G6solar_2015-2099.nc","r")
    f11 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-LR_G6sulfur_2015-2099.nc","r")
    
    fref1 = addfile ("F:/datafill/2099/tas_MRI-ESM2-0_ssp585_2015-2100.nc","r")
    fref2 = addfile ("F:/datafill/2099/tas_IITM-ESM_ssp370_2015-2100.nc","r")
    fref3 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-HR_ssp370_2015-2100.nc","r")
    fref4 = addfile ("F:/datafill/2099/tas_MPI-ESM1-2-LR_ssp370_2015-2100.nc","r")
    
    fout1 = addfile ("F:/datafill/2100/tas_CAMS-CSM1-0_ssp119_2015-2100.nc","c")
    fout2 = addfile ("F:/datafill/2100/tas_CAMS-CSM1-0_ssp126_2015-2100.nc","c")
    fout3 = addfile ("F:/datafill/2100/tas_CAMS-CSM1-0_ssp245_2015-2100.nc","c")
    fout4 = addfile ("F:/datafill/2100/tas_CAMS-CSM1-0_ssp370_2015-2100.nc","c")
    fout5 = addfile ("F:/datafill/2100/tas_CAMS-CSM1-0_ssp585_2015-2100.nc","c")
    
    fout6 = addfile ("F:/datafill/2100/tas_IITM-ESM_ssp245_2015-2100.nc","c")
    fout7 = addfile ("F:/datafill/2100/tas_IITM-ESM_ssp585_2015-2100.nc","c")
    
    fout8 = addfile ("F:/datafill/2100/tas_MPI-ESM1-2-HR_G6solar_2015-2100.nc","c")
    fout9 = addfile ("F:/datafill/2100/tas_MPI-ESM1-2-HR_G6sulfur_2015-2100.nc","c")
    fout10 = addfile ("F:/datafill/2100/tas_MPI-ESM1-2-LR_G6solar_2015-2100.nc","c")
    fout11 = addfile ("F:/datafill/2100/tas_MPI-ESM1-2-LR_G6sulfur_2015-2100.nc","c")
    
    
    fout1->tas=fref1->tas
    
    fout2->tas=fout1->tas
    fout3->tas=fout1->tas
    fout4->tas=fout1->tas
    fout5->tas=fout1->tas
    
    fout1->tas(0:84,:,:)=(/f1->tas/)
    fout2->tas(0:84,:,:)=(/f2->tas/)
    fout3->tas(0:84,:,:)=(/f3->tas/)
    fout4->tas(0:84,:,:)=(/f4->tas/)
    fout5->tas(0:84,:,:)=(/f5->tas/)
    fout1->tas(85,:,:)=(/f1->tas(84,:,:)/)
    fout2->tas(85,:,:)=(/f2->tas(84,:,:)/)
    fout3->tas(85,:,:)=(/f3->tas(84,:,:)/)
    fout4->tas(85,:,:)=(/f4->tas(84,:,:)/)
    fout5->tas(85,:,:)=(/f5->tas(84,:,:)/)
    
    fout6->tas=fref2->tas
    fout7->tas=fout6->tas
    
    fout6->tas(0:84,:,:)=(/f6->tas/)
    fout6->tas(85,:,:)=(/f6->tas(84,:,:)/)
    fout7->tas(0:84,:,:)=(/f7->tas/)
    fout7->tas(85,:,:)=(/f7->tas(84,:,:)/)
    
    fout8->tas=fref3->tas
    fout9->tas=fout8->tas
    
    fout8->tas(0:84,:,:)=(/f8->tas/)
    fout8->tas(85,:,:)=(/f8->tas(84,:,:)/)
    
    fout9->tas(0:4,:,:)=(/f8->tas(0:4,:,:)/)
    fout9->tas(5:84,:,:)=(/f9->tas/)
    fout9->tas(85,:,:)=(/fout9->tas(84,:,:)/)
    
    
    fout10->tas=fref4->tas
    fout11->tas=fout10->tas
    
    fout10->tas(0:84,:,:)=(/f10->tas/)
    fout10->tas(85,:,:)=(/f10->tas(84,:,:)/)
    fout11->tas(0:84,:,:)=(/f11->tas/)
    fout11->tas(85,:,:)=(/f11->tas(84,:,:)/)
    
    
end
