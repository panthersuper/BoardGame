class Export {
  PrintWriter output;
  ArrayList<PLine> pls;
  ArrayList<Building> bls;
  String dir;
  Export(ArrayList<PLine> pls, ArrayList<Building> bls, String dir) {
    this.pls = pls;
    this.bls = bls;
    this.dir = dir;
  }

  void out() {
    output = createWriter(dir+"model.txt"); 

    output.println("lstPL = []");
    for (int i=0; i<pls.size (); i++) {
      output.println("pts"+i+" = []");
      for (int j=0; j<pls.get (i).VList.size(); j++) {
        Vector2d vv= pls.get(i).VList.get(j);
        output.println("pts"+i+".append(Point("+vv.getX()+","+ (height-vv.getY())+"))");
      }
      output.println("lstPL.append(PLine("+"pts"+i+"))");
    }
    output.println("a.put(lstPL)");

    output.println("lstbd = []");
    output.println("hs = []");

    for (int i=0; i<bls.size (); i++) {
      output.println("b"+i+" = []");
      for (int j=0; j<bls.get (i).gridList.size(); j++) {
        output.println("grid"+i+"_"+j+" = []");
        Vector2d v1 = bls.get(i).gridList.get(j).l_t;
        Vector2d v2 = bls.get(i).gridList.get(j).l_b;
        Vector2d v3 = bls.get(i).gridList.get(j).r_b;
        Vector2d v4 = bls.get(i).gridList.get(j).r_t;

        output.println("grid"+i+"_"+j+".append(Point("+v1.getX()+","+ (height-v1.getY())+"))");
        output.println("grid"+i+"_"+j+".append(Point("+v2.getX()+","+ (height-v2.getY())+"))");
        output.println("grid"+i+"_"+j+".append(Point("+v3.getX()+","+ (height-v3.getY())+"))");
        output.println("grid"+i+"_"+j+".append(Point("+v4.getX()+","+ (height-v4.getY())+"))");
        output.println("grid"+i+"_"+j+".append(Point("+v1.getX()+","+ (height-v1.getY())+"))");

        output.println("b"+i+".append(PLine("+"grid"+i+"_"+j+"))");
      }
      output.println("lstbd.append("+"b"+i+")");
      output.println("");

      output.println("");
      output.println("");
      output.println("");
      output.println("");
      output.println("");

      output.println("hs.append("+bls.get(i).gridList.get(0).value*10+")");
    }
    output.println("b.put(lstbd)");
    output.println("c.put(hs)");


    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
  }
}

