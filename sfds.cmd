@if "%1"=="" (
	echo sfds: simplified cmd for sfdx
	echo for usage, type sfds help
) else if %1==list (
	sfdx force:org:list
) else if %1==open (
	if "%~2"=="" (
		sfdx force:org:open
	) else if "%~2"=="-u" (
		if "%~3"=="" (
			sfdx force:org:open
		) else (
			sfdx force:org:open -u %3
		)
	) else (
		sfdx force:org:open -u %2
	)
) else if %1==status (
	sfdx force:source:status
) else if %1==convert (
	if "%~2"=="" (
		sfdx force:source:convert -d outputTmp/
	) else (
		sfdx force:source:convert -d %2
	)
) else if %1==push (
	if "%~2"=="" (
		sfdx force:source:push
	) else if "%~2"=="-u" (
		if "%~3"=="" (
			sfdx force:source:push
		) else (
			sfdx force:source:push -u %3
		)
	) else (
		sfdx force:source:push -u %2
	)
) else if %1==pull (
	if "%~2"=="" (
		sfdx force:source:pull
	) else if "%~2"=="-u" (
		if "%~3"=="" (
			sfdx force:source:pull
		) else (
			sfdx force:source:pull -u %3
		)
	) else (
		sfdx force:source:pull -u %2
	)
) else if %1==createProject (
	if "%~2"=="" (
		echo Please specify a project name
	) else if "%~2"=="-n" (
		if "%~3"=="" (
			echo Please specify a project name
		) else (
			sfdx force:project:create -n %3
		)
	) else (
		sfdx force:project:create -n %2
	)
) else if %1==createOrg (
	if "%~2"=="" (
		echo Please specify an org name
	) else if "%~2"=="-a" (
		if "%~3"=="" (
			echo Please specify an org name
		) else (
			sfdx force:org:create -f config/project-scratch-def.json -a %3
		)
	) else (
		sfdx force:org:create -f config/project-scratch-def.json -a %2
	)
) else if %1==deploy (
	if "%~2"=="" (
		sfdx force:mdapi:deploy -d outputTmp/ -w 100
	) else if "%~2"=="-u" (
		if "%~3"=="" (
			sfdx force:mdapi:deploy -d outputTmp/ -w 100
		) else (
			sfdx force:mdapi:deploy -d outputTmp/ -u %3 -w 100
		)
	) else (
		sfdx force:mdapi:deploy -d outputTmp/ -u %2 -w 100
	)
) else if %1==default (
	if "%~2"=="" (
		echo Please specify the default org name
	) else (
		sfdx force:config:set defaultusername=%2
	)
) else if %1==help (
	echo sfds:                  simplified command line tool for Salesforce dx CLI
	echo sfds list:             list all the orgs
	echo sfds open:             open an org. If org name is not specified, opens default one. E.g. sfds open tempOrg
	echo sfds createOrg:        create an org. Always need to specify a name. E.g. sfds createOrg tempOrg
	echo sfds status:           display source status
	echo sfds convert:          convert project code into metadata folder. The folder name is outputTmp
	echo sfds push:             push project changes into org. Can specify org name
	echo sfds pull:             pull changes from org. Can specify org name
	echo sfds createProject:    create an sfdx project. Must specify project name. E.g. sfds createProject sampleProj
	echo sfds deploy:           deploy the changes to targeted org. If org name is not specified, deploy to default org
	echo sfds default:          change default org 
) else (
	echo sfds: parameter not supported. 
	echo Type sfds help to get more info
)