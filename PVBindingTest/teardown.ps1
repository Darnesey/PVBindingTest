# uninstall all releases
Write-Host "Uninstalling Helm Releases..."
helm uninstall bind bind1 bind2 bind3 bind4 bind5

Write-Host "Removing PVs"
kc delete pv -l volumeGroup=testbind