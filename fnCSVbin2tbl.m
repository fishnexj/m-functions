//fnCSVbin2tbl
//This function mass converts csv binaries into tables, for easy aggregation
(content as binary, filename) =>
let
    importCSV = Csv.Document(content,[Encoding=1252, QuoteStyle=QuoteStyle.None]),
    promoteHdr = Table.PromoteHeaders(importCSV),
    tblCol = Table.AddColumn(promoteHdr, "filename", each filename)
in
    tblCol
