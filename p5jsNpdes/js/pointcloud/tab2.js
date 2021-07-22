function parsePointCloud(data, scale, xAdd, yAdd, zAdd)
{
    let lines = data.split("\n");

    let header = true;
    for (var i = 0; i < lines.length - 1; i++) {
      if(lines[i].includes("end_header"))
      {
        header = false;
        continue;
      }

      if(!header)
      {
        let data = lines[i].split(" ");

        let x = parseFloat(data[0]);
        let y = -parseFloat(data[1]);
        let z = parseFloat(data[2]);

        let r = parseFloat(data[3]) / 255.0;
        let g = parseFloat(data[4]) / 255.0;
        let b = parseFloat(data[5]) / 255.0;


        if(x === NaN || y === NaN || z === NaN)
        {
          continue;
        }

        vertices.push(x * scale + xAdd);
        vertices.push(y * scale + yAdd);
        vertices.push(z * scale + zAdd);

        colors.push(r);
        colors.push(g);
        colors.push(b);
      }
    }
}
