<script lang="ts">
	// Mock data for tickets
	const tickets = [
		{
			id: 1,
			title: "Implement user authentication",
			description: "Add JWT-based user authentication system",
			status: "Backlog",
			acceptanceCriteria: [
				{ id: 1, description: "User can register with email and password", status: "PENDING" },
				{ id: 2, description: "User can login and receive JWT token", status: "PENDING" },
				{ id: 3, description: "Protected routes require valid JWT", status: "PENDING" }
			],
			createdAt: "2026-01-10"
		},
		{
			id: 2,
			title: "Create backlog view",
			description: "Implement the main backlog view showing all tickets",
			status: "In Progress",
			acceptanceCriteria: [
				{ id: 1, description: "Backlog view displays list of all tickets", status: "PASSED" },
				{ id: 2, description: "Each ticket shows title and description", status: "PENDING" },
				{ id: 3, description: "Tickets can be filtered by status", status: "PENDING" }
			],
			createdAt: "2026-01-11"
		},
		{
			id: 3,
			title: "Add drag and drop functionality",
			description: "Implement drag and drop for moving tickets between columns",
			status: "Backlog",
			acceptanceCriteria: [
				{ id: 1, description: "Tickets can be dragged between columns", status: "PENDING" },
				{ id: 2, description: "Visual feedback during drag operation", status: "PENDING" },
				{ id: 3, description: "State persists after dropping", status: "PENDING" }
			],
			createdAt: "2026-01-09"
		},
		{
			id: 4,
			title: "Implement ticket creation modal",
			description: "Create modal for adding new tickets with description and ACs",
			status: "Backlog",
			acceptanceCriteria: [
				{ id: 1, description: "New Ticket button opens modal", status: "PENDING" },
				{ id: 2, description: "Modal has description and AC fields", status: "PENDING" },
				{ id: 3, description: "Form validation prevents empty submissions", status: "PENDING" }
			],
			createdAt: "2026-01-08"
		}
	];

	// Modal state
	let showModal = false;
	let newTicketTitle = '';
	let newTicketDescription = '';
	let newTicketAcceptanceCriteria = '';

	function openModal() {
		showModal = true;
		// Reset form fields
		newTicketTitle = '';
		newTicketDescription = '';
		newTicketAcceptanceCriteria = '';
	}

	function closeModal() {
		showModal = false;
	}

	function createTicket() {
		// Validate required fields
		if (!newTicketTitle.trim() || !newTicketDescription.trim() || !newTicketAcceptanceCriteria.trim()) {
			alert('Please fill in all required fields');
			return;
		}

		// Parse acceptance criteria (one per line)
		const acLines = newTicketAcceptanceCriteria.trim().split('\n').filter(line => line.trim());
		const acceptanceCriteria = acLines.map((description, index) => ({
			id: tickets.length * 10 + index + 1, // Simple ID generation
			description: description.trim(),
			status: 'PENDING' // Default status for new ACs
		}));

		// Create new ticket
		const newTicket = {
			id: tickets.length + 1,
			title: newTicketTitle.trim(),
			description: newTicketDescription.trim(),
			status: 'Backlog',
			acceptanceCriteria,
			createdAt: new Date().toISOString().split('T')[0] // YYYY-MM-DD format
		};

		// Add to tickets array
		tickets.push(newTicket);

		// Close modal
		closeModal();
	}
</script>

<div class="container mx-auto px-4 py-8">
	<header class="mb-8">
		<h1 class="text-3xl font-bold text-gray-800 dark:text-white mb-2">Backlog</h1>
		<p class="text-gray-600 dark:text-gray-300">A list view with all tickets created. Each ticket corresponds to a User Story.</p>
	</header>

	<div class="mb-6 flex justify-between items-center">
		<div class="text-sm text-gray-500 dark:text-gray-400">
			Showing <span class="font-semibold">{tickets.length}</span> tickets
		</div>
		<button 
			on:click={openModal}
			class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition-colors"
		>
			+ New Ticket
		</button>
	</div>

	<div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg overflow-hidden">
		<div class="overflow-x-auto">
			<table class="w-full">
				<thead class="bg-gray-50 dark:bg-gray-700">
					<tr>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">ID</th>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Title</th>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Description</th>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Status</th>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Acceptance Criteria</th>
						<th class="py-3 px-6 text-left text-xs font-medium text-gray-500 dark:text-gray-300 uppercase tracking-wider">Created</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-gray-200 dark:divide-gray-700">
					{#each tickets as ticket (ticket.id)}
						<tr class="hover:bg-gray-50 dark:hover:bg-gray-750 transition-colors">
							<td class="py-4 px-6 text-sm font-mono text-gray-500 dark:text-gray-400">#{ticket.id}</td>
							<td class="py-4 px-6">
								<div class="font-medium text-gray-900 dark:text-white">{ticket.title}</div>
							</td>
							<td class="py-4 px-6">
								<div class="text-sm text-gray-600 dark:text-gray-300 max-w-xs truncate">{ticket.description}</div>
							</td>
							<td class="py-4 px-6">
								<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium 
									{ticket.status === 'Backlog' ? 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300' : 
									ticket.status === 'In Progress' ? 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300' : 
									'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300'}">
									{ticket.status}
								</span>
							</td>
							<td class="py-4 px-6">
								<div class="space-y-1">
									{#each ticket.acceptanceCriteria as ac (ac.id)}
										<div class="flex items-center text-sm">
											<span class="mr-2 {ac.status === 'PASSED' ? 'text-green-500' : 'text-gray-400'}">
												{#if ac.status === 'PASSED'}
													✓
												{:else}
													○
												{/if}
											</span>
											<span class="text-gray-600 dark:text-gray-400">{ac.description}</span>
										</div>
									{/each}
								</div>
							</td>
							<td class="py-4 px-6 text-sm text-gray-500 dark:text-gray-400">{ticket.createdAt}</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>

	<div class="mt-8 text-center text-gray-500 dark:text-gray-400 text-sm">
		<p>This is the Backlog view showing all tickets. Each ticket corresponds to a User Story with acceptance criteria.</p>
		<p class="mt-1">Click "New Ticket" to create a new ticket with description and acceptance criteria.</p>
	</div>

	<!-- New Ticket Modal -->
	{#if showModal}
		<div class="fixed inset-0 z-50 overflow-y-auto">
			<!-- Background overlay -->
			<div class="fixed inset-0 bg-black bg-opacity-50 transition-opacity" on:click={closeModal}></div>
			
			<!-- Modal container -->
			<div class="flex min-h-full items-center justify-center p-4">
				<!-- Modal panel -->
				<div 
					class="relative w-full max-w-md transform overflow-hidden rounded-2xl bg-white dark:bg-gray-800 p-6 shadow-xl transition-all"
					on:click|stopPropagation
				>
					<!-- Modal header -->
					<div class="mb-6">
						<h2 class="text-2xl font-bold text-gray-900 dark:text-white">Create New Ticket</h2>
						<p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
							Add a new ticket with description and acceptance criteria.
						</p>
					</div>

					<!-- Modal content -->
					<div class="space-y-4">
						<div>
							<label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
								Title <span class="text-red-500">*</span>
							</label>
							<input 
								type="text" 
								bind:value={newTicketTitle}
								class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
								placeholder="Enter ticket title"
							/>
						</div>
						<div>
							<label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
								Description <span class="text-red-500">*</span>
							</label>
							<textarea 
								bind:value={newTicketDescription}
								class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
								rows="3"
								placeholder="Enter ticket description"
							></textarea>
							<p class="mt-1 text-xs text-gray-500 dark:text-gray-400">This field is required</p>
						</div>
						<div>
							<label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
								Acceptance Criteria (one per line) <span class="text-red-500">*</span>
							</label>
							<textarea 
								bind:value={newTicketAcceptanceCriteria}
								class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white"
								rows="4"
								placeholder="Enter acceptance criteria, one per line"
							></textarea>
							<p class="mt-1 text-xs text-gray-500 dark:text-gray-400">This field is required</p>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="mt-8 flex justify-end space-x-3">
						<button 
							on:click={closeModal}
							class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
						>
							Cancel
						</button>
						<button 
							on:click={createTicket}
							class="px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors"
						>
							Create Ticket
						</button>
					</div>

					<!-- Close button -->
					<button 
						on:click={closeModal}
						class="absolute top-4 right-4 text-gray-400 hover:text-gray-500 dark:hover:text-gray-300"
					>
						<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
						</svg>
					</button>
				</div>
			</div>
		</div>
	{/if}
</div>