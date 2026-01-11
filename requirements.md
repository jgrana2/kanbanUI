A web application done in SvelteKit with TailwindCSS and Shadcn.

The application has a Backlog view where all the tickets or sticker notes are created. This is usually a list view with all the tickets created. Each ticket correspond to a User Story that is created by the user in free writing natural language. There is a New Ticket button to create a new one and a modal opens with the information about the ticket. Mandatory: description and acceptance criterias (ACs). Each AC has a status parameter which can be PENDING or PASSED. The application then must interpret the user's intent and rewrite the User Story in a detailed and clear one with verifiable Acceptance Criterias. The user write what they need in free writing and the application then rewrittes a clear and detailed version including verifiable and accurate criterias that must be satisfied before marked as passed.

In the same Backlog list view, the user is able to select one or more tickets with checkboxes and add them to a Sprint, which is a timeframe where the feature or fix is implemented in code and verified. The Sprint length is the time it takes to complete all the tickets in that sprint with all ACs passed. The user can then select multiple backlog items and add them to a Sprint or drag and drop them in the desired Spring. There is a Start Sprint button that marks the beginning of working on the tickets in the Sprint. This work is done by a bash loop which will be included manually. For code you just call an API to start working on the Sprint. Then when the Sprint is finished, the results are displayed on another summary page or panel in the application. The way the loop works is as it is working in this current project where you are, which is ./loop.sh and SYSTEM_PROMPT.md. We want to make a nice UI for that workflow. Use Shadcn dark themes and sleek design with microanimations and interactivity with hover mouse and so on. The application has a clean and minimalistic UI with drag and drop items and easy and intuitive use.

Add basic user management with JWT.

Add a minimalistic landing page.

The application is delivered tested and running for the user to try on localhost.

Access GitHub using GITHUB_TOKEN. 

Use the Google Custom Search API using GOOGLE_CSE_ID and GOOGLE_API_KEY in case you want to search the web.