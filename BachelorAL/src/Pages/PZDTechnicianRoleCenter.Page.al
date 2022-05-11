page 50123 "PZD Technician Role Center"
{
    PageType = RoleCenter;
    Caption = 'Technician Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Customer)
            {
                part("Techncian Activities"; "PZD Technician Main Activities")
                {
                    Caption = 'Technician Activities';
                }
                part("PZD Customer Issues"; "PZD Customer Issue ListPart")
                {
                    Caption = 'Customer Issues';
                }
            }
        }
    }
}