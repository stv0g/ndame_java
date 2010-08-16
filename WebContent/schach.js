function schach(sol) {
	solution = sol.split('|');
	n = solution.length;

	html = '<table class="show"><tr><td class="headleft"></td>';
	for (col = 0; col < n; col++)
		html += '<td class="headleft">' + (col + 1) + '</td>';
		
	html += '</tr>';
		
	for (row = 0; row < n; row++) {
		html += '<tr><td class="headleft">' + (row + 1) + '</td>';
		color = row % 2;
		for (col = 0; col < n; col++) {
				html += (col % 2) == color ? '<td class="black">' : '<td class="white">';
			if (col == solution[row] - 1)
				html += '<img src="dame.gif" alt="X" />';
			html += '</td>';
		}
		html += '</tr>';
	}
	html += '</table>';
	document.getElementById('show').innerHTML = html;
}