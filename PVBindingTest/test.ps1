# Simple startup to run multiple installs

Write-Host "Deleting stale PVs"
kc delete pv -l volumeGroup=testbind

Write-Host "Installing PVs"
helm install bind bindingtest
helm install bind1 bindingtest
helm install bind2 bindingtest
helm install bind3 bindingtest
helm install bind4 bindingtest
helm install bind5 bindingtest

# check the PV states
Write-Host "Running 'kubectl get pv' to print off list of persistent volumes"
$output = kubectl get pv -l volumeGroup=testbind

if (Select-String -InputObject $output -pattern 'Available') {
    Write-Host "A PV was not bounded properly"
}
else {
    Write-Host "All PVs bounded successfully"
}

kubectl get pv -l volumeGroup=testbind