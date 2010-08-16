package de.steffenvogel.ndame;

import java.util.ArrayList;

public class DameArr {
	private int n;
	private int row;
	private int col;

	private ArrayList<int[]> solutions;
	private int[][] locked;
	private int[] set;
	
	public int solcount = 0;
	
	public DameArr(int n) {
		this.n = n;
		
		solutions = new ArrayList<int[]>();
		locked = new int[n][n];
		set = new int[n];
		
		row = 0;
		col = 0;
	
		for (int i = 0; i < n; i++) {
			set[i] = -1; // noch keine Dame wurde in diese Zeile gesetzt
		}
		
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				locked[i][j] = 0;
			}
		}
		
	}

	public void run() {
		while (row < n) {
			while (col < n) {
				if (check(row, col) && col > set[row]) {
					set(row, col);
					break;
				} else {
					col++;
				}
			}
			
			if (col == n) {
				if (set[row - 1] >= n - 1 && row == 1)
					break;
				else
					backtrack();
			} else {
				row++;
				col = 0;

				if (row == n) {
					if (n < 14)
						solutions.add(set.clone());
					solcount++;
					backtrack();
				}
			}
		}
	}
	
	private boolean check(int row, int col) {
		return (locked[row][col] > 0) ? false : true;
	}
	
	private void set(int row, int col) {
		for (int i = 0; i < n; i++)
			locked[row][i]++; // Vertikal

		for (int j = 0; j < n; j++)
			locked[j][col]++; // Horizontal

		for (int k = 0; k < n; k++)
			if ((col - row + k) < n && (col - row + k) >= 0)
				locked[k][col - row + k]++; // Diagonal oben links -> unten rechts

		for (int l = 0; l < n; l++)
			if ((row + col - l) < n && (row + col - l) >= 0)
				locked[l][row + col - l]++; // Diagonal unten links -> oben rechts

		set[row] = col;
	}
	
	void unSet(int row, int col) {
		for (int i = 0; i < n; i++)
			locked[row][i]--; // Vertikal

		for (int j = 0; j < n; j++)
			locked[j][col]--; // Horizontal

		for (int k = 0; k < n; k++)
			if ((col - row + k) < n && (col - row + k) >= 0)
				locked[k][col - row + k]--; // Diagonal oben links -> unten rechts

		for (int l = 0; l < n; l++)
			if ((row + col - l) < n && (row + col - l) >= 0)
				locked[l][row + col - l]--; // Diagonal unten links -> oben rechts

		set[row] = -1;
	}
	
	public ArrayList<int[]> getSolutions() {
		return solutions;
	}
	
	private void backtrack() {
		row--;
		
		col = set[row] + 1;
		unSet(row, set[row]);
	}
}

