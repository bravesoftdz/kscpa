unit ImportTM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  dotm, ExtCtrls, ZcGridStyle, ZcCalcExpress, ZcFormulas, ZcDBGrids,
  ZcUniClass, ZJGrid, ZcDataGrid, ZcGridClasses
  ;

type
  TfmImportTM = class(TForm)
    dlgOpen1: TOpenDialog;
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TButton;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    ejungrid1: TEjunDataGrid;
    EjunDBGrid1: TEjunDBGrid;
    btn2: TButton;
    lbl1: TLabel;
    pnl6: TPanel;
    lbl2: TLabel;
    EjunLicense1: TEjunLicense;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure EjunDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmImportTM: TfmImportTM;
  Aimporttm: tdotm;

implementation

uses
  ucommunit;

{$R *.dfm}

procedure TfmImportTM.FormCreate(Sender: TObject);
begin
  Aimporttm := tdotm.create;
  EjunDBGrid1.DataSet := Aimporttm.getLISTqry;
  // EjunDBGrid1.Column
  EjunDBGrid1.Columns[1].FieldName := 'name';
  EjunDBGrid1.Columns[2].FieldName := 'id';
  EjunDBGrid1.Columns[3].FieldName := 'km';
  EjunDBGrid1.Columns[1].Title := '�½���';
  EjunDBGrid1.Columns[2].Title := '�½ں�';
  EjunDBGrid1.Columns[3].Title := '��Ŀ��';
  EjunDBGrid1.ColWidths[1] := 200;
  EjunDBGrid1.ColWidths[2] := 60;
  EjunDBGrid1.ColWidths[3] := 60;

  EjunDBGrid1.ACTIVATE(True);

  EjunGrid1.ColWidths[1] := 500;
  EjunGrid1.ColWidths[2] := 70;
  EjunGrid1.ColWidths[3] := 70;

  EjunGrid1.Columns[1].Title := '�ļ���';
  EjunGrid1.Columns[2].Title := '�½ں�';
  EjunGrid1.Columns[3].Title := '��Ŀ��';

  pnl1.Caption := '';
  pnl2.Caption := '';
  pnl3.Caption := '';
  pnl4.Caption := '';
  pnl5.Caption := '';

end;

procedure TfmImportTM.btn1Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := mainpath;
  dlgOpen1.Filter := '*.HTM|*.htm';
  // ExtractFilePath(Application.ExeName);

  dlgOpen1.Execute;
  if dlgOpen1.Files.Count > 0 then
  begin
    Aimporttm.AFILELIST := dlgOpen1.Files;
  end;
  //  Aimporttm.AFILELIST.Clear;
  //  Aimporttm.AFILELIST.Add(ExtractFilePath(Application.ExeName) + 'aaa.htm');
  Aimporttm.From_ALL_HTMLFILE;
end;

procedure TfmImportTM.btn2Click(Sender: TObject);
var
  i: integer;
begin
  dlgOpen1.InitialDir := mainpath;
  dlgOpen1.Filter := '*.HTM|*.htm';
  // ExtractFilePath(Application.ExeName);

  dlgOpen1.Execute;
  EjunGrid1.Clear(true);
  EjunGrid1.RowCount := dlgOpen1.Files.Count + 1;

  for i := 0 to dlgOpen1.Files.Count - 1 do
  begin
    EjunGrid1.Cells[1, i + 1].value := dlgOpen1.Files[i];
  end;

end;

procedure TfmImportTM.EjunDBGrid1DblClick(Sender: TObject);
begin
  ejungrid1.Cells[2, ejungrid1.CurRow].value := ejundbgrid1.Cells[2,
    ejungrid1.CurRow].value;
  ejungrid1.Cells[3, ejungrid1.CurRow].value := ejundbgrid1.Cells[3,
    ejungrid1.CurRow].value;
end;

end.
