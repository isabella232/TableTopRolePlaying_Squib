#remove all old output folders
$listOfOutputFolders = Get-ChildItem | Where-Object {$_.FullName -match "_output"}
foreach ($outputFolder in $listOfOutputFolders)
{
    remove-item $outputFolder -force -recurse
}

#generate new output folders
$listOfCharacterCardDocuments = Get-ChildItem | Where-Object {$_.FullName -match "_CC.xlsx"}

foreach ($characterCardDocument in $listOfCharacterCardDocuments)
{
    $xlsxNameOfDocument = $characterCardDocument.Name
    $csvNameOfDocument = $xlsxNameOfDocument -replace ".xlsx",".csv"
    .\XlsToCsv.vbs $xlsxNameOfDocument $csvNameOfDocument

    ruby generate-charactercards.rb $csvNameOfDocument

    $xlsxNameOfDocument -match "_Data-(?<content>.*).xlsx"
    $docShortName = $matches['content']

    $outputDirName = resolve-path _output
    $newOutputDirName = $outputDirName -replace "_output","_output-$docShortName"

    #rename folder
    rename-item $outputDirName $newOutputDirName

    #delete old csv
    remove-item $csvNameOfDocument
}