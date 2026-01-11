## What was changed

Implemented functionality to ensure each acceptance criterion has a status parameter (PENDING or PASSED) and that this is visible in the UI. Enhanced the ticket creation modal to create tickets with ACs that have status parameters.

### Changes:
1. Modified `src/routes/+page.svelte`:
   - Added state variables for modal form fields
   - Added `createTicket()` function that creates AC objects with `status: 'PENDING'` for new ACs
   - Updated modal inputs with `bind:value` to connect to state variables
   - Connected Create Ticket button to `createTicket()` function
   - Added required field indicators and helper text

## How to verify
1. View existing tickets - each AC shows a status indicator (✓ for PASSED, ○ for PENDING)
2. Click 'New Ticket' button to open modal
3. Fill in required fields (Title, Description, Acceptance Criteria)
4. Click 'Create Ticket' - new ticket appears in backlog
5. Verify new ticket's ACs have status 'PENDING' in the UI
6. Application runs on localhost:5175 (verified with curl)
7. Type checking passes with no errors (only accessibility warnings)

## Explicit statement
Only one acceptance criterion was implemented: REQ-001 AC-004 - Each acceptance criterion has a status parameter that can be PENDING or PASSED.