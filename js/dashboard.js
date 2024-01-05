async function updateDashboard() {
    try {
        const response = await fetch('/api/dashboard'); // replace with your API endpoint
        const data = await response.json();

        document.getElementById('totalEvents').innerText = data.totalEvents;
        document.getElementById('totalCategories').innerText = data.totalCategories;
        document.getElementById('totalVenues').innerText = data.totalVenues;
        document.getElementById('totalBookings').innerText = data.totalBookings;
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

// Update dashboard on page load
document.addEventListener('DOMContentLoaded', updateDashboard);