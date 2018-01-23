configuration ConfigureWebDsc
{
    param
    (
        [Parameter(Mandatory = $false)]
        [String]$WebMessage = "Test Page"
    )

    # Import the module that defines custom resources
    Import-DscResource -Module xWebAdministration, PSDesiredStateConfiguration

    Node localhost
    {
        WindowsFeature IIS
        {
            Ensure          = 'Present'
            Name            = 'Web-Server'
        }

        xWebsite DefaultSite 
        {
            Ensure          = 'Present'
            Name            = 'Default Web Site'
            State           = 'Started'
            PhysicalPath    = 'C:\inetpub\wwwroot'
            DependsOn       = '[WindowsFeature]IIS'
        }

        File WebContent
        {
            Ensure          = 'Present'
            DestinationPath = 'C:\inetpub\wwwroot\index.html'
            Recurse         = $true
            Type            = 'File'
            Contents        = "<html><body><h1>$WebMessage</h1></body></html>" 
            DependsOn       = '[xWebsite]DefaultSite'
        }       
    }
}
