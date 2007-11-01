{$IFNDEF __QUEUE_TEMPLATE__}
unit t_dzQueueTemplate;

interface

uses
  Classes,
  u_MyItem;

type
  _QUEUE_ITEM_ = integer;
  _QUEUE_CONTAINER_TYPE_ = TList;
  _LIST_CONTAINER_ITEM_TYPE_ = Pointer;
  _QUEUE_ANCESTOR_ = TObject;

{$ENDIF __QUEUE_TEMPLATE__}

{$IFNDEF __QUEUE_TEMPLATE_SECOND_PASS__}

type
  _QUEUE_TEMPLATE_ = class(_QUEUE_ANCESTOR_)
  private
    FList: _QUEUE_CONTAINER_TYPE_;
  public
    constructor Create;
    destructor Destroy; override;
    {! This is just an alias for Enqueue }
    procedure Push(_Item: _QUEUE_ITEM_);
    procedure Enqueue(_Item: _QUEUE_ITEM_);
    {! This is just an alias for Dequeue }
    function Pop: _QUEUE_ITEM_;
    function Dequeue: _QUEUE_ITEM_; overload;
    {! @returns true, if an item was dequeued, false otherwise
       @param Item contains the dequeued item, only valid if result is true }
    function Dequeue(out _Item: _QUEUE_ITEM_): boolean; overload;
    function Peek: _QUEUE_ITEM_;
    function IsEmpty: boolean;
    function Count: integer;
  end;

{$ENDIF __QUEUE_TEMPLATE_SECOND_PASS__}

{$IFNDEF __QUEUE_TEMPLATE__}
implementation
{$DEFINE __QUEUE_TEMPLATE_SECOND_PASS__}
{$ENDIF __QUEUE_TEMPLATE__}

{$IFDEF __QUEUE_TEMPLATE_SECOND_PASS__}

{ _QUEUE_TEMPLATE_ }

constructor _QUEUE_TEMPLATE_.Create;
begin
  inherited Create;
  FList := _QUEUE_CONTAINER_TYPE_.Create;
end;

destructor _QUEUE_TEMPLATE_.Destroy;
begin
  FList.Free;
  inherited;
end;

function _QUEUE_TEMPLATE_.Count: integer;
begin
  Result := FList.Count;
end;

procedure _QUEUE_TEMPLATE_.Enqueue(_Item: _QUEUE_ITEM_);
begin
  FList.Insert(0, _LIST_CONTAINER_ITEM_TYPE_(_Item));
end;

function _QUEUE_TEMPLATE_.Dequeue: _QUEUE_ITEM_;
var
  Idx: integer;
begin
  Idx := FList.Count - 1;
  Assert(Idx > 0);

  Result := _QUEUE_ITEM_(FList[Idx]);
  FList.Delete(Idx);
end;

function _QUEUE_TEMPLATE_.Dequeue(out _Item: _QUEUE_ITEM_): boolean;
var
  Idx: integer;
begin
  Idx := FList.Count - 1;
  Result := (Idx >= 0);
  if Result then begin
    _Item := _QUEUE_ITEM_(FList[Idx]);
    FList.Delete(Idx);
  end;
end;

function _QUEUE_TEMPLATE_.Peek: _QUEUE_ITEM_;
begin
  Assert(FList.Count >= 0);

  Result := _QUEUE_ITEM_(FList[FList.Count - 1]);
end;

function _QUEUE_TEMPLATE_.IsEmpty: boolean;
begin
  Result := (FList.Count = 0);
end;

procedure _QUEUE_TEMPLATE_.Push(_Item: _QUEUE_ITEM_);
begin
  Enqueue(_Item);
end;

function _QUEUE_TEMPLATE_.Pop: _QUEUE_ITEM_;
begin
  Result := Dequeue;
end;

{$ENDIF __QUEUE_TEMPLATE_SECOND_PASS__}

{$IFNDEF __QUEUE_TEMPLATE__}
{$WARNINGS off}
end.
{$ELSE __QUEUE_TEMPLATE__}

{$DEFINE __QUEUE_TEMPLATE_SECOND_PASS__}

{$ENDIF __QUEUE_TEMPLATE__}

