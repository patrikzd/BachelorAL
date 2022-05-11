tableextension 50101 "PZD Purchase Line" extends "Purchase Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = if (Type = const(Phone)) "PZD Phones";
        }
    }
}