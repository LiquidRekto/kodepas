unit cli_run;
interface
    uses crt, sysutils, process,
        kpprint in '././effect/print/kpprint.pas',
        kpini in '././ini/kpini.pas';
    procedure cli_run_run;
implementation
    //lấy đường dẫn mẹ
    function GetParent(input:string):string;
        begin
            exit(extractFileName(ExtractFileDir(input)));
        end;
    //lấy đường dẫn con
    function GetChild(input:string):string;
        begin
            exit(extractFileName(input));
        end;
    procedure cli_run_run;
    begin
        kpprint_process('[Start] Run project');
        kpprint_process('-------------------------------------------------');
        ExecuteProcess(kpini_string('local.ini', 'CONFIG', 'bin'),'');
        kpprint_process('-------------------------------------------------');
        kpprint_complete('[Done ] Run complete');
    end;
end.