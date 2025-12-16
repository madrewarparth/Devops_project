let transactions = JSON.parse(localStorage.getItem('transactions') || '[]');
let budget = parseFloat(localStorage.getItem('budget') || '0');

// CI/CD Test - Debug log
console.log('Finance Dashboard loaded - CI/CD Pipeline Test!');

// Tab switching
document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', () => {
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
        tab.classList.add('active');
        document.getElementById(tab.dataset.tab).classList.add('active');
        if (tab.dataset.tab === 'charts') renderCharts();
    });
});

// Add transaction
document.getElementById('transactionForm').addEventListener('submit', (e) => {
    e.preventDefault();
    const transaction = {
        id: Date.now(),
        description: document.getElementById('description').value,
        amount: parseFloat(document.getElementById('amount').value),
        type: document.getElementById('type').value,
        category: document.getElementById('category').value,
        date: document.getElementById('date').value
    };
    transactions.push(transaction);
    saveData();
    e.target.reset();
    document.getElementById('date').valueAsDate = new Date();
    updateDashboard();
    checkBudget();
});

// Set budget
document.getElementById('budgetForm').addEventListener('submit', (e) => {
    e.preventDefault();
    budget = parseFloat(document.getElementById('budgetAmount').value);
    localStorage.setItem('budget', budget);
    checkBudget();
});

// Delete transaction
function deleteTransaction(id) {
    transactions = transactions.filter(t => t.id !== id);
    saveData();
    updateDashboard();
    checkBudget();
}

// Update dashboard
function updateDashboard() {
    const income = transactions.filter(t => t.type === 'income').reduce((sum, t) => sum + t.amount, 0);
    const expense = transactions.filter(t => t.type === 'expense').reduce((sum, t) => sum + t.amount, 0);
    const balance = income - expense;

    document.getElementById('totalIncome').textContent = `₹${income.toFixed(2)}`;
    document.getElementById('totalExpense').textContent = `₹${expense.toFixed(2)}`;
    document.getElementById('balance').textContent = `₹${balance.toFixed(2)}`;

    renderTransactions();
}

// Render transactions
function renderTransactions() {
    const list = document.getElementById('transactionsList');
    if (transactions.length === 0) {
        list.innerHTML = '<p style="text-align:center;color:#999;">No transactions yet</p>';
        return;
    }

    list.innerHTML = transactions.sort((a, b) => new Date(b.date) - new Date(a.date)).map(t => `
        <div class="transaction-item ${t.type}">
            <div class="transaction-info">
                <h4>${t.description}</h4>
                <p>${t.category} • ${new Date(t.date).toLocaleDateString()}</p>
            </div>
            <span class="transaction-amount ${t.type}">${t.type === 'income' ? '+' : '-'}₹${t.amount.toFixed(2)}</span>
            <button class="delete-btn" onclick="deleteTransaction(${t.id})">Delete</button>
        </div>
    `).join('');
}

// Check budget
function checkBudget() {
    const status = document.getElementById('budgetStatus');
    if (budget === 0) {
        status.innerHTML = '<p style="color:#999;">No budget set</p>';
        return;
    }

    const currentMonth = new Date().getMonth();
    const currentYear = new Date().getFullYear();
    const monthExpenses = transactions.filter(t => {
        const d = new Date(t.date);
        return t.type === 'expense' && d.getMonth() === currentMonth && d.getFullYear() === currentYear;
    }).reduce((sum, t) => sum + t.amount, 0);

    const percentage = (monthExpenses / budget) * 100;
    const remaining = budget - monthExpenses;
    let progressClass = '';
    if (percentage >= 100) progressClass = 'danger';
    else if (percentage >= 80) progressClass = 'warning';

    status.innerHTML = `
        <p><strong>Budget:</strong> ₹${budget.toFixed(2)}</p>
        <p><strong>Spent:</strong> ₹${monthExpenses.toFixed(2)}</p>
        <p><strong>Remaining:</strong> ₹${remaining.toFixed(2)}</p>
        <div class="budget-bar">
            <div class="budget-progress ${progressClass}" style="width:${Math.min(percentage, 100)}%">
                ${percentage.toFixed(0)}%
            </div>
        </div>
        ${percentage >= 100 ? '<p style="color:#f45c43;font-weight:bold;">⚠️ Budget exceeded!</p>' : ''}
        ${percentage >= 80 && percentage < 100 ? '<p style="color:#f5576c;font-weight:bold;">⚠️ Approaching budget limit!</p>' : ''}
    `;
}

// Render charts
function renderCharts() {
    renderPieChart();
    renderLineChart();
}

// Pie chart
function renderPieChart() {
    const canvas = document.getElementById('pieChart');
    const ctx = canvas.getContext('2d');
    const expenses = transactions.filter(t => t.type === 'expense');
    
    if (expenses.length === 0) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = '#999';
        ctx.font = '16px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('No expense data', canvas.width / 2, canvas.height / 2);
        return;
    }

    const categories = {};
    expenses.forEach(t => {
        categories[t.category] = (categories[t.category] || 0) + t.amount;
    });

    const colors = ['#667eea', '#f45c43', '#38ef7d', '#f5576c', '#4facfe', '#f093fb', '#11998e', '#764ba2'];
    const total = Object.values(categories).reduce((sum, v) => sum + v, 0);
    
    canvas.width = 400;
    canvas.height = 300;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    let startAngle = 0;
    Object.entries(categories).forEach(([cat, amount], i) => {
        const sliceAngle = (amount / total) * 2 * Math.PI;
        ctx.fillStyle = colors[i % colors.length];
        ctx.beginPath();
        ctx.moveTo(200, 150);
        ctx.arc(200, 150, 100, startAngle, startAngle + sliceAngle);
        ctx.closePath();
        ctx.fill();

        // Label
        const midAngle = startAngle + sliceAngle / 2;
        const x = 200 + Math.cos(midAngle) * 130;
        const y = 150 + Math.sin(midAngle) * 130;
        ctx.fillStyle = '#333';
        ctx.font = '12px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(`${cat} ₹${amount.toFixed(0)}`, x, y);

        startAngle += sliceAngle;
    });
}

// Line chart
function renderLineChart() {
    const canvas = document.getElementById('lineChart');
    const ctx = canvas.getContext('2d');
    
    if (transactions.length === 0) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = '#999';
        ctx.font = '16px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('No transaction data', canvas.width / 2, canvas.height / 2);
        return;
    }

    canvas.width = 400;
    canvas.height = 300;
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    const sorted = [...transactions].sort((a, b) => new Date(a.date) - new Date(b.date));
    let balance = 0;
    const points = sorted.map(t => {
        balance += t.type === 'income' ? t.amount : -t.amount;
        return { date: new Date(t.date), balance };
    });

    if (points.length === 0) return;

    const maxBalance = Math.max(...points.map(p => p.balance), 0);
    const minBalance = Math.min(...points.map(p => p.balance), 0);
    const range = maxBalance - minBalance || 1;

    const padding = 40;
    const width = canvas.width - padding * 2;
    const height = canvas.height - padding * 2;

    // Draw axes
    ctx.strokeStyle = '#ddd';
    ctx.beginPath();
    ctx.moveTo(padding, padding);
    ctx.lineTo(padding, canvas.height - padding);
    ctx.lineTo(canvas.width - padding, canvas.height - padding);
    ctx.stroke();

    // Draw line
    ctx.strokeStyle = '#667eea';
    ctx.lineWidth = 2;
    ctx.beginPath();
    points.forEach((p, i) => {
        const x = padding + (i / (points.length - 1 || 1)) * width;
        const y = canvas.height - padding - ((p.balance - minBalance) / range) * height;
        if (i === 0) ctx.moveTo(x, y);
        else ctx.lineTo(x, y);
    });
    ctx.stroke();

    // Draw points
    ctx.fillStyle = '#667eea';
    points.forEach((p, i) => {
        const x = padding + (i / (points.length - 1 || 1)) * width;
        const y = canvas.height - padding - ((p.balance - minBalance) / range) * height;
        ctx.beginPath();
        ctx.arc(x, y, 4, 0, 2 * Math.PI);
        ctx.fill();
    });

    // Labels
    ctx.fillStyle = '#666';
    ctx.font = '12px Arial';
    ctx.textAlign = 'center';
    ctx.fillText(`₹${maxBalance.toFixed(0)}`, 20, padding);
    ctx.fillText(`₹${minBalance.toFixed(0)}`, 20, canvas.height - padding);
}

// Export JSON
document.getElementById('exportJSON').addEventListener('click', () => {
    const data = { transactions, budget };
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    download(blob, 'finance-data.json');
});

// Export CSV
document.getElementById('exportCSV').addEventListener('click', () => {
    const csv = ['Date,Description,Category,Type,Amount', ...transactions.map(t => 
        `${t.date},${t.description},${t.category},${t.type},${t.amount}`
    )].join('\n');
    const blob = new Blob([csv], { type: 'text/csv' });
    download(blob, 'finance-data.csv');
});

// Import
document.getElementById('importBtn').addEventListener('click', () => {
    const file = document.getElementById('importFile').files[0];
    if (!file) return alert('Select a file!');

    const reader = new FileReader();
    reader.onload = (e) => {
        try {
            if (file.name.endsWith('.json')) {
                const data = JSON.parse(e.target.result);
                transactions = data.transactions || [];
                budget = data.budget || 0;
            } else if (file.name.endsWith('.csv')) {
                const lines = e.target.result.split('\n').slice(1);
                transactions = lines.filter(l => l.trim()).map(l => {
                    const [date, description, category, type, amount] = l.split(',');
                    return { id: Date.now() + Math.random(), date, description, category, type, amount: parseFloat(amount) };
                });
            }
            saveData();
            localStorage.setItem('budget', budget);
            updateDashboard();
            checkBudget();
            alert('Data imported!');
        } catch {
            alert('Invalid file!');
        }
    };
    reader.readAsText(file);
});

// Clear data
document.getElementById('clearBtn').addEventListener('click', () => {
    if (!confirm('Clear all data?')) return;
    transactions = [];
    budget = 0;
    saveData();
    localStorage.setItem('budget', '0');
    updateDashboard();
    checkBudget();
});

function download(blob, filename) {
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    a.click();
    URL.revokeObjectURL(url);
}

function saveData() {
    localStorage.setItem('transactions', JSON.stringify(transactions));
}

// Initialize
document.getElementById('date').valueAsDate = new Date();
updateDashboard();
checkBudget();
