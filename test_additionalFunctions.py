from additionalFunctions import getRowCurs, EPI_adapter, extractionRegistre, prettyExtractionRegistre

# ------------------------------------
# Test getRowCurs
# ------------------------------------
# Get row and cursor for epi No1
rowCurs = getRowCurs(1)
print(rowCurs[0])

# ------------------------------------
# Test EPI_adapter
# ------------------------------------
# Create an adapter object
epi = EPI_adapter(rowCurs)

# Test str
print('----- TEST str ----')
print(str(epi))

# Test print
print('----- TEST print ----')
epi.print()


# ------------------------------------
# Test register extraction
# ------------------------------------
extractionRegistre('testExportRegister.md')
prettyExtractionRegistre('testExportRegister_pretty.md')