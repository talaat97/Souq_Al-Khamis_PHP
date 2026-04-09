/// ORDER STATUS REFERENCE
/// ╔═══════╦══════════════════════════════════╦════════════════════╦══════════════════════╦═════════════╗
/// ║ Value ║ Admin Label                      ║ User Sees          ║ Delivery Sees        ║ Color       ║
/// ╠═══════╬══════════════════════════════════╬════════════════════╬══════════════════════╬═════════════╣
/// ║   0   ║ Cancelled                        ║ Cancelled          ║ —                    ║ Red         ║
/// ║   1   ║ Waiting Approval                 ║ Wait to approve    ║ Wait admin approval  ║ Yellow      ║
/// ║   2   ║ Pending (waiting driver pickup)  ║ Preparing          ║ Pending              ║ Deep Yellow ║
/// ║   3   ║ Shipping (driver took the order) ║ On the way         ║ Accepted / Working   ║ Green       ║
/// ║   4   ║ Archived (delivered)             ║ Archived           ║ Done / Archived      ║ Grey        ║
/// ╚═══════╩══════════════════════════════════╩════════════════════╩══════════════════════╩═════════════╝
