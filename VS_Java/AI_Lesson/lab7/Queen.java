package Lab6_Ex1;

public class Queen {
    private int row;
    private int column;
    private int N;
    public Queen(int row, int column) {
        super();
        this.row = row;
        this.column = column;
    }

    public int getColumn() {
        return column;
    }

    public int getRow() {
        return row;
    }
    public void move(){
        if(column==0) column=N-1;
        else column--;
    }
    public boolean isConflict(Queen queen){
        if(queen.getRow() == this.row) return true;
        if (queen.getColumn() == this.column) return true;
        if (queen.getRow()-this.row == queen.getColumn()-this.column) return true;
        if (queen.getRow()+this.row == queen.getColumn()+this.column) return true;
        return false;
    }
}

