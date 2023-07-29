; Below is an NCL script example for processing CMIP6 data.
; This code calculates multimodel ensemble.

begin 
    fils = systemfunc ("ls F:/Regional_diff/SSP119/*.nc") ; file paths
    print(fils)
    print(sizeof(fils)/4)
    f = addfiles (fils, "r")   
    ListSetType (f, "join")        ; concatenate (=default)
    Stat = f[:]->Stat
    printVarSummary (Stat)
    
    
    fout1 = addfile ("F:/Ensemble/SSP119_ensemble.nc", "c")
    fout1->Stat=Stat
    
end