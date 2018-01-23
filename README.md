Example Template Deploymend with DSC Script
-------------------------------------------

The purpose of this repository is to provide example code to discuss template deployments and debugging of Desired State Configuration (DSC) scripts for Azure VMs. You can find more examples, details, and discussion on [my blog](https://blogs.msdn.microsoft.com/mihansen).

To package the DSC script with dependencies:

```
cd .\DSC
Publish-AzureRmVMDscConfiguration .\SetupWebServer.ps1 -OutputArchivePath .\SetupWebServer.ps1.zip
```
