package Lab6_Ex1;

import java.util.*;

public class Node {
    public static final int N = 8;
    private Queen[] state;
    public Node() {

        state = new Queen[N];
    }
    public Node(Queen[] state) {
        this.state = new Queen[N];
        for (int i = 0; i < state.length; i++) {
            this.state[i] = new Queen(state[i].getRow(),
                    state[i].getColumn());

        }
    }
    public Node(Node n) {
        this.state = new Queen[N];
        for (int i = 0; i < N; i++) {
            Queen qi = n.state[i];
            this.state[i] = new Queen(qi.getRow(),
                    qi.getColumn());

        }
    }
    public int getH(){
        int result = 0;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if( i < j && state[i].isConflict(state[j]))
                    result++;
            }
        }
        return result;
    }
    public List<Node> generateAllCandidates() {
        List<Node> result = new ArrayList<Node>();
        for (int i = 0; i < N; i++) {
            Node tmp = new Node(this.state);
            tmp.state[i].move();

            result.add(tmp);
        }
        result.sort(Comparator.comparing(Node::getH));
        return result;
    }
    public Node execute(Node initialState) {
        Node current = initialState;
        int hCurrent = current.getH();
        int hParent = 999;
        while (hCurrent < hParent) {
            if (current.getH()==0) return current;
            List<Node> candidates = current.generateAllCandidates();
            Node node=  candidates.get(0);
            if(hCurrent >= node.getH()){
                hParent = hCurrent;
                hCurrent = node.getH();
                current = node;

            }
        }
        return null;
    }
    public Node executeHillClimbingWithRandomRestart(Node initialState) {
        Node bestSolution = null;
        int minConflicts = Integer.MAX_VALUE;
        int restartCount = 0;

        while (minConflicts != 0) {
            Node currentSolution = execute(initialState);
            if (currentSolution != null && currentSolution.getH() == 0) {
                return currentSolution; // Found a solution with no conflicts
            }

            if (currentSolution != null && currentSolution.getH() < minConflicts) {
                minConflicts = currentSolution.getH();
                bestSolution = currentSolution;
            }

            restartCount++;
            initialState = generateRandomState(); // Generate a new random state
        }

        System.out.println("Number of restarts: " + restartCount);
        return bestSolution;
    }

    // Helper method to generate a random state
    private Node generateRandomState() {
        Queen[] randomState = new Queen[N];
        Random rand = new Random();

        for (int i = 0; i < N; i++) {
            randomState[i] = new Queen(i, rand.nextInt(N)); // Random column for each row
        }

        return new Node(randomState);
    }
    public Node selectNextRandomCandidate() {
        Random rand = new Random();
        Node candidate = new Node(this);

        int col = rand.nextInt(N);
        int newRow = rand.nextInt(N);

        while (newRow == candidate.state[col].getRow()) {
            newRow = rand.nextInt(N);
        }
        
        candidate.state[col] = new Queen(newRow, col);

        return candidate;
    }


}
