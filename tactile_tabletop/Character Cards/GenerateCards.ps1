#function csvExists($fileToCheck)
#{
#    $listOfCurrentCsvs = Get-ChildItem | Where-Object {$_.FullName -match ".csv"}
#    foreach ($file in $listOfCurrentCsvs)
#    {
#        $fileName = $file.Name
#        Write-Host "###checking if '$fileName' is equal to '$fileToCheck'"
#        if($fileName -eq $fileToCheck)
#        {
#            return $true
#        }
#    }
#    return $false
#}


#remove all old output folders
Write-Host "removing old output folders"
Write-Host "+++++++++++++++++++++++++++"
$listOfOutputFolders = Get-ChildItem | Where-Object {$_.FullName -match "_output"}
foreach ($outputFolder in $listOfOutputFolders)
{
    remove-item $outputFolder -force -recurse -ErrorAction SilentlyContinue
}

#generate new output folders
$listOfCharacterCardDocuments = Get-ChildItem | Where-Object {$_.FullName -match "CC.csv"}
write-host ""
Write-Host "iterating over documents to generate card pngs"
$failureFound = $false
foreach ($characterCardDocument in $listOfCharacterCardDocuments)
{
    if ($failureFound)
    {
        exit
    }
    write-host ""
    Write-Host "working on $characterCardDocument"
    Write-Host "+++++++++++++++++++++++++++++++++"

    #$xlsxNameOfDocument = $characterCardDocument.Name
    #$csvNameOfDocument = $xlsxNameOfDocument -replace ".xlsx",".csv"
    #Write-Host "__csv version of input file: $csvNameOfDocument"

    #if (csvExists($csvNameOfDocument))
    #{
    #    Write-Host "__previous csv found, removing"
    #    remove-item $csvNameOfDocument
    #}

    #Write-Host "___generating new csv..."
    #Write-Host "++++++++++++++++++++++++"
    #.\XlsToCsv.vbs $xlsxNameOfDocument $csvNameOfDocument
    #$maxAttempts = 5
    #$currentAttempt = 0
    #Write-Host ""
    #Write-Host "waiting for csv to finish being created..."
    #while ($currentAttempt -lt $maxAttempts)
    #{
    #    if(csvExists($csvNameOfDocument))
    #    {
    #        Write-Host "____csv found, operating on it"
    #        $currentAttempt = 99
    #    }
    #    else
    #    {
    #        Write-Host "____csv not found, waiting and will check again..."
    #        $currentAttempt++
    #        sleep 1
    #    }
    #}
    Write-Host ""
    #if(csvExists($csvNameOfDocument))
    #{
    Write-Host "executing ruby script on the generated csv"
    Write-Host "++++++++++++++++++++++++++++++++++++++++++"
    ruby generate-charactercards.rb $characterCardDocument

    $documentName = $characterCardDocument.Name
    #set the 'content' variable of "$matches" special powershell thing to the part we want to copy
    $documentName -match "_Data-(?<content>.*).csv"
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
    #delete old csv
    #Write-Host "____removing old csv"
    #remove-item $csvNameOfDocument
    #}
    #else
    #{
    #    Write-Host "____failed to generate csv"
    #    $failureFound = $true
    #}
    Write-Host "--------------------"
}
if ($failureFound)
{
    Write-Host "ran into an error, ending early"
}