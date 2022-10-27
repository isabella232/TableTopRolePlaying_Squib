


#remove all old output folders
Write-Host "removing old output folders"
Write-Host "+++++++++++++++++++++++++++"
$listOfOutputFolders = Get-ChildItem | Where-Object {$_.FullName -match "_output"}
foreach ($outputFolder in $listOfOutputFolders)
{
    remove-item $outputFolder -force -recurse -ErrorAction SilentlyContinue
}

#generate new output folders
$listOfCardDocuments = Get-ChildItem | Where-Object {$_.FullName -match "Cards.csv"}
write-host ""
Write-Host "iterating over documents to generate card pngs"
$failureFound = $false
foreach ($cardDocument in $listOfCardDocuments)
{
    if ($failureFound)
    {
        exit
    }
    write-host ""
    Write-Host "working on $cardDocument"
    Write-Host "+++++++++++++++++++++++++++++++++"

    Write-Host ""
    Write-Host "executing ruby script on the csv"
    Write-Host "++++++++++++++++++++++++++++++++++++++++++"
    ruby generate-objectivecards.rb $cardDocument

    $documentName = $cardDocument.Name
    #set the 'content' variable of "$matches" special powershell thing to the part we want to copy
    $documentName -match "(?<content>.*).csv"
    $docShortName = $matches['content']

    $outputDirName = resolve-path _output -ErrorAction SilentlyContinue
    if(test-path $outputDirName)
    {
        Write-Host "____output folder generated, renaming it for parsability"
        $newOutputDirName = $outputDirName -replace "_output","_output-$docShortName"

        #rename folder
        rename-item $outputDirName $newOutputDirName
    }
    else
    {
        Write-Host "____output folder not generated"
        $failureFound = $true
    }
    Write-Host "--------------------"
}
if ($failureFound)
{
    Write-Host "ran into an error, ending early"
}