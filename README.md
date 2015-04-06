![](https://ci.appveyor.com/api/projects/status/snr9hsdt7ut9g56y?svg=true)

####What is it?

An [Appease](http://appease.io) task template that sets an [Azure SQL Database](http://azure.microsoft.com/en-us/services/sql-database/).

####How do I install it?

```PowerShell
Add-AppeaseTask `
    -DevOpName YOUR-DEVOP-NAME `
    -TemplateId SetAzureSqlDatabase
```

####What parameters are required?

#####Name
description: a `string` representing the name of the Sql Database.

#####ServerName
description: a `string` representing the name of the Sql Database Server this Sql Database will be added to.

####What parameters are optional?

#####Edition
description: a `string` representing the edition of the Sql Database.  
known allowed values: `Basic`,`Standard`,`Premium`

#####MaxSizeGB
description: a `int` representing the maximum size (in GB) of the Sql Database
