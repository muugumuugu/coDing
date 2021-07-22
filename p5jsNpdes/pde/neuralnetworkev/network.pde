class Network {
  int inodes1, hnodes1, onodes1;
  float lr = 0.005f;
  //float[] inputs;
  float[][] hweights, oweights;

  Network(int tinodes, int thnodes, int tonodes, float[][] thweights, float[][] toweights) {
    inodes1 = tinodes;
    hnodes1 = thnodes;
    onodes1 = tonodes;

    hweights = thweights;
    oweights = toweights;
  }

  float[][] query(float[][] inputslist) {
    //float[][] tempinputs = new float[inputslist.length][1];
    //for(int i = 0; i < inputslist.length; i++){
    //  tempinputs[i][0] = inputslist[i];
    //}
    float[][] inputs = inputslist;
    //float[][] targets = transpose(targetslist);

    float[][] hiddeni = multiply(hweights, inputs);
    float[][] hiddeno = sigmoidarray(hiddeni);

    float[][] finali = multiply(oweights, hiddeno);
    float[][] finalo = sigmoidarray(finali);

    return finalo;
  }
  float[][] multiply(float[][] a, float[][] b) {
    int m1 = a.length;
    int n1 = a[0].length;
    int m2 = b.length;
    int n2 = b[0].length;
    if (n1 != m2) throw new RuntimeException("Illegal matrix dimensions.");
    float[][] c = new float[m1][n2];
    for (int i = 0; i < m1; i++) {
      for (int j = 0; j < n2; j++) {
        for (int k = 0; k < n1; k++) {
          c[i][j] += a[i][k] * b[k][j];
        }
      }
    }
    return c;
  }

  float[][] sigmoidarray(float[][] inputs) {
    float[][] output = new float[inputs.length][inputs[0].length];
    for (int i = 0; i < inputs.length; i++) {
      for (int j = 0; j < inputs[0].length; j++) {
        output[i][j] = sigmoid(inputs[i][j]);
      }
    }
    return output;
  }

  float sigmoid(float input) {
    return (float) (1.0f/(1.0f+pow(2.71828182846f, -input)));
  }
}
