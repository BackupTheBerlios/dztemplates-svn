{$IFNDEF __SORT_PROVIDER_TEMPLATE__}
unit t_dzSortProvider;

interface

uses
  SysUtils,
  Classes,
  u_dzQuicksort;

type
  _DZ_SORT_ITEM_ = pointer;

{$ENDIF __SORT_PROVIDER_TEMPLATE__}

{$IFNDEF __SORT_PROVIDER_TEMPLATE_SECOND_PASS__}

type
  TSortProviderItemAccess = function(_Idx: integer): _DZ_SORT_ITEM_ of object;

type
  _SORT_PROVIDER_ = class
  private
    FSortedIdx: array of integer;
    FItemAccess: TSortProviderItemAccess;
    FItemCompare: TCompareItemsMeth;
    FItemCount: integer;

    function GetItems(_Idx: integer): _DZ_SORT_ITEM_;
    procedure doSwapItems(_Idx1, _Idx2: integer);
    function doCompareItems(_Idx1, _Idx2: integer): integer;
  public
    constructor Create(_ItemAccess: TSortProviderItemAccess; _ItemCompare: TCompareItemsMeth; _ItemCount: integer);
    procedure Update(_ItemCount: integer);
    property Count: integer read FItemCount;
    property Items[_Idx: integer]: _DZ_SORT_ITEM_ read GetItems; default;
  end;
{$ENDIF __SORT_PROVIDER_TEMPLATE_SECOND_PASS__}

{$IFNDEF __SORT_PROVIDER_TEMPLATE__}
implementation
{$ENDIF __SORT_PROVIDER_TEMPLATE__}

{$IFDEF __SORT_PROVIDER_TEMPLATE_SECOND_PASS__}

{ _SORT_PROVIDER_ }

constructor _SORT_PROVIDER_.Create(_ItemAccess: TSortProviderItemAccess; _ItemCompare: TCompareItemsMeth; _ItemCount: integer);
begin
  inherited Create;
  FItemAccess := _ItemAccess;
  FItemCompare := _ItemCompare;

  Update(_ItemCount);
end;

function _SORT_PROVIDER_.GetItems(_Idx: integer): _DZ_SORT_ITEM_;
begin
  Result := FItemAccess(FSortedIdx[_Idx]);
end;

function _SORT_PROVIDER_.doCompareItems(_Idx1, _Idx2: integer): integer;
begin
  Result := FItemCompare(FSortedIdx[_Idx1], FSortedIdx[_Idx2]);
end;

procedure _SORT_PROVIDER_.doSwapItems(_Idx1, _Idx2: integer);
var
  p: integer;
begin
  p := FSortedIdx[_Idx1];
  FSortedIdx[_Idx1] := FSortedIdx[_Idx2];
  FSortedIdx[_Idx2] := p;
end;

procedure _SORT_PROVIDER_.Update(_ItemCount: integer);
var
  i: integer;
begin
  FItemCount := _ItemCount;

  SetLength(FSortedIdx, Count);
  for i := 0 to Count - 1 do
    begin
      FSortedIdx[i] := i;
    end;

  QuickSort(0, Count - 1, doCompareItems, doSwapItems);
end;

{$WARNINGS off}
{$IFNDEF __SORT_PROVIDER_TEMPLATE__}
end.
{$ENDIF __SORT_PROVIDER_TEMPLATE__}
{$ENDIF __SORT_PROVIDER_TEMPLATE_SECOND_PASS__}
{$DEFINE __SORT_PROVIDER_TEMPLATE_SECOND_PASS__}

