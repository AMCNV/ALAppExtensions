Codeunit 13654 FIK_ReadFile
{
    TableNo = 1220;

    VAR
        FIKFileNotValidErr: Label 'The selected file is not a FIK file.';
        FIKPrefixValidateTxt: Label 'FI0';

    trigger OnRun();
    var
        ReadStream: InStream;
        FIKLine: Text;
        ReadLen: Integer;
    begin
        "File Content".CREATEINSTREAM(ReadStream);
        REPEAT
            ReadLen := ReadStream.READTEXT(FIKLine);
            IF ReadLen > 0 THEN
                IF STRPOS(FIKLine, FIKPrefixValidateTxt) <> 1 THEN
                    ERROR(FIKFileNotValidErr);
        UNTIL ReadLen = 0;

        CODEUNIT.RUN(CODEUNIT::"Fixed File Import", Rec);
    end;
}

