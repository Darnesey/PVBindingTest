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

Write-Host "Waiting a few seconds for PVs to bind"
Start-Sleep -Seconds 3

# check the PV states
Write-Host "Running 'kubectl get pv' to print off list of persistent volumes"
$output = kubectl get pv

if (Select-String -InputObject $output -pattern 'Available.*pvc') {
    Write-Host "A PV may not have been bounded properly"
}
else {
    Write-Host "All PVs bounded successfully"
}

kubectl get pv
