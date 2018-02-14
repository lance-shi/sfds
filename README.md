# Sfds
Sfds is a simplified version of Salesforce DX CLI command line tool. 
I love Salesforce DX. But personally I find those commands to be too long to remember. 
As an example, if I want to change the default org, I need to type something like: 

```sh
sfdx force:config:set defaultusername=test-wvkpnfm5z113@example.com
```

Shouldn't it be just something like: 
```sh
sfds default tempOrg
```

For me, I find the simplified version much easier to remember. So I have created the batch file to simplify that. 

## Install
Simply copy slds.cmd into your computer. And make the path into your system %path% variable. 

## Usage
```sh
sfds:                  simplified command line tool for Salesforce dx CLI
sfds list:             list all the orgs
sfds open:             open an org. If org name is not specified, opens default one. E.g. sfds open tempOrg
sfds createOrg:        create an org. Always need to specify a name. E.g. sfds createOrg tempOrg
sfds status:           display source status
sfds convert:          convert project code into metadata folder. The folder name is outputTmp
sfds push:             push project changes into org. Can specify org name
sfds pull:             pull changes from org. Can specify org name
sfds createProject:    create an sfdx project. Must specify project name. E.g. sfds createProject sampleProj
sfds deploy:           deploy the changes to targeted org. If org name is not specified, deploy to default org
sfds default:          change default org
sfds help:             get the help info
```