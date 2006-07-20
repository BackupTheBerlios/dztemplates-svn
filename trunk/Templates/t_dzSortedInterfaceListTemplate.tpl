{$IFNDEF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}
unit t_dzSortedInterfaceListTemplate;

interface

{: any class built on this template must add these units to the uses clause }
uses
  Classes,
  u_dzQuicksort;

{: these types must be declared for any class built on this template }
type
  {: the ancestor class for the template, can be TObject or TInterfacedObject
     or anything else you like}
  _LIST_ANCESTOR_ = TObject;
  {: The item type to be stored in the list }
  _ITEM_TYPE_ = IInterface;
  {: The type of the item's keys }
  _KEY_TYPE_ = integer;

{$ENDIF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}

{$IFNDEF __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}

{$DEFINE __DZ_SORTED_LIST_TEMPLATE__}

type
  {: Container type used to actually store the items: TList or TInterfacelist }
  _LIST_CONTAINER_ = TInterfaceList;
  {: The native item type of the list container (Pointer for TList, IInterface for TInterfaceList}
  _LIST_CONTAINER_ITEM_TYPE_ = IINTERFACE;

{$INCLUDE 't_dzSortedListTemplate.tpl'}

type
  {: Extends _DZ_SORTED_LIST_TEMPLATE_ to call the item's Free method in FreeItem,
     thereby allowing to store any TObject descendant. }
  _DZ_SORTED_INTERFACE_LIST_TEMPLATE_ = class(_DZ_SORTED_LIST_TEMPLATE_)
  end;

{$ENDIF __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}

{$IFNDEF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}
{$DEFINE __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}
implementation
{$ENDIF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}

{$IFDEF __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}

{ _DZ_SORTED_INTERFACE_LIST_TEMPLATE_ }

{$INCLUDE 't_dzSortedListTemplate.tpl'}

{$ENDIF __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}

{$DEFINE __DZ_SORTED_INTERFACE_LIST_TEMPLATE_SECOND_PASS__}

{$IFNDEF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}
{$WARNINGS OFF}
end.
{$ENDIF __DZ_SORTED_INTERFACE_LIST_TEMPLATE__}

