/*****************************************************************

 *************** FRACTAL TERRAIN GENERATION IN 3-D ***************

 *****************************************************************

 THIS CODE WILL GIVE U AN IDEA ABOUT GENERATING A 3-D
 FRACTAL SURFACE USING 3-D TRANSFORMATIONS AND FRACTAL ALGORITHM.

 THE IDEA IS LIKE THIS:
 SUPPOSE U HAVE A SQUARE PLANE DIVIDED INTO FOUR QUDRANTS.
 U FIND THE MIDPOINT OF IT AND DISPLACE IT ABOVE OR BELOW ORIGIN
 BY GAUSS() FUNCTION.IN THE CODE BELOW, I'VE USED 20x20 MESH FOR
 LARGER SURFACE.THE GAUSS() FUNCTION RETURNS RANDOM DISPLACEMENT
 VALUE FOR THE MIDPOINT AND WE CAN USE THAT FOR CANYONISM EFFECT

  _________
 |    |    |
 |____|____|
 |    |    |
 |____|____|
  _________
 |  __|__  |   <- RANDOM Z-DISPLACEMENT
 |_/  |  \_|
 |    |    |
 |____|____|
		  OR
  _________
 |  __\__  |    <- RANDOM Z-DISPLACEMENT
 |_/  /  \_|
 |   /     |
 |__|______|

 AXES ARE AS FOLLOWS:

		     Y       Z       X
		      \      |      /
			\    |    /
			  \  |  /
			    \|/

 THE POLYGON FILLING ALGORITHM IS CRUDE AND RECURSIVE AND TAKES TIME FOR
 LARGER ITERATION VALUES.
 USE BOTH FRAC() AND FRAC2() TO SEE THE DIFFERENCES.
 IF U DONT HAVE ANY IDEA ABOUT 3-D TRANSFORMATIONS, GET IT FROM
 FLIPCODE ,GAMEDEV.NET OR FROM VLA'S TUTS.

 KEYS :
       'q' : QUIT
       'z' : ZOOM IN
       'x' : ZOOM OUT
       'a','d' : ROTATE AROUND Z-AXIS
       'w','s' : ROTATE AROUND ARBIT AXIS (PERPENDICULAR
		 TO Z-AXIS AND AT 45 DEGREES TO X AND Y-AXES)


 EMAIL : anitemp84@yahoo.com

 BY:    ANIRUDDHA MARATHE

	(DOING COMPUTER ENGG, PES MODERN COLLEGE OF ENGG.,
	PUNE 411005, INDIA.)

 EMAIL ME IF U GET INTO TROUBLE...
 (FULL TUTORIAL ON FRACTALS COMING SOON...)

******************************************************************/

#include<stdio.h>
#include<conio.h>
#include<graphics.h>
#include<stdlib.h>
#include<math.h>

// struct for 4 edges
typedef struct ver
{
   float x1,y1,z1,x2,y2,z2;
   float x3,y3,z3,x4,y4,z4;
   float fx1,fy1,fx2,fy2; //viewing coords
   float fx3,fy3,fx4,fy4;
}V;

// fill polygon - too simple and inefficient ;)
int div_fill(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4,int n)
{
  float x12,y12,x23,y23,x34,y34,x41,y41,x1234,y1234;
  int colore,tx,ty;
  if(n == 0)
  {
    line(320+x1,250-y1,320+x2,250-y2);
    line(320+x2,250-y2,320+x3,250-y3);
    line(320+x3,250-y3,320+x4,250-y4);


    line(320+x4,250-y4,320+x1,250-y1);
  }
  else
  {
      x12 = (x1+x2)/2;
      y12 = (y1+y2)/2;
      x23 = (x2+x3)/2;
      y23 = (y2+y3)/2;
      x34 = (x3+x4)/2;
      y34 = (y3+y4)/2;
      x41 = (x4+x1)/2;
      y41 = (y4+y1)/2;

      x1234 = (x1+x3)/2;
      y1234 = (y2+y4)/2;

      div_fill(x1,y1,x12,y12,x1234,y1234,x41,y41,n-1);
      div_fill(x2,y2,x23,y23,x1234,y1234,x12,y12,n-1);
      div_fill(x3,y3,x34,y34,x1234,y1234,x23,y23,n-1);
      div_fill(x4,y4,x41,y41,x1234,y1234,x34,y34,n-1);
  }
  return 0;
}

//display simple mesh
void disp(V p[][20],int f_dis,int itern)
{
 int i,j,k,l;

 if(f_dis == 0)
    cleardevice();
 else
 {
 for(i = 19;i>=0;i--)
 {
  for(j = 19;j>=0;j--)
  {
//   setcolor(12-(p[i][j].fy1/21+7));
   setcolor((23-i)*(22-j)>>2+3);
   line(320+p[i][j].fx1,250-p[i][j].fy1,320+p[i][j].fx2,250-p[i][j].fy2);
   line(320+p[i][j].fx2,250-p[i][j].fy2,320+p[i][j].fx3,250-p[i][j].fy3);
   line(320+p[i][j].fx3,250-p[i][j].fy3,320+p[i][j].fx4,250-p[i][j].fy4);
   line(320+p[i][j].fx4,250-p[i][j].fy4,320+p[i][j].fx1,250-p[i][j].fy1);

   div_fill(p[i][j].fx1,p[i][j].fy1,p[i][j].fx2,p[i][j].fy2,p[i][j].fx3,p[i][j].fy3,p[i][j].fx4,p[i][j].fy4,itern);
  }
 }
 }
}

//display dense mesh
void disp2(V p[][20],int f_dis)
{
 int i,j,k,l;

 if(f_dis == 0)
    cleardevice();
 else
 {
 for(i = 19;i>=0;i--)
 {
  for(j = 19;j>=0;j--)
  {
   setcolor(12-(p[i][j].fy1/25+5));
//   setcolor((23-i)*(22-j)>>2+3);
   line(320+p[i][j].fx1,250-p[i][j].fy1,320+p[i][j].fx2,250-p[i][j].fy2);
   line(320+p[i][j].fx2,250-p[i][j].fy2,320+p[i][j].fx3,250-p[i][j].fy3);
   line(320+p[i][j].fx3,250-p[i][j].fy3,320+p[i][j].fx4,250-p[i][j].fy4);
   line(320+p[i][j].fx4,250-p[i][j].fy4,320+p[i][j].fx1,250-p[i][j].fy1);

  }
 }
 }
}

//convert from 3-d co-ordinates to screen co-ordinates
void convert(V p[][20])
{
  int i,j;
  float t = 30.0;
  float angi,ang = 30.0;
  t = 3.142/180.0;
  angi = t * ang;

  for(i = 0;i<20;i++)
  {
    for(j = 0;j<20;j++)
    {
      p[i][j].fx1 = p[i][j].x1*cos(angi) - p[i][j].y1*cos(angi);
      p[i][j].fy1 = p[i][j].x1*sin(angi) + p[i][j].y1*sin(angi) + p[i][j].z1;

      p[i][j].fx2 = p[i][j].x2*cos(angi) - p[i][j].y2*cos(angi);
      p[i][j].fy2 = p[i][j].x2*sin(angi) + p[i][j].y2*sin(angi) + p[i][j].z2;

      p[i][j].fx3 = p[i][j].x3*cos(angi) - p[i][j].y3*cos(angi);
      p[i][j].fy3 = p[i][j].x3*sin(angi) + p[i][j].y3*sin(angi) + p[i][j].z3;

      p[i][j].fx4 = p[i][j].x4*cos(angi) - p[i][j].y4*cos(angi);
      p[i][j].fy4 = p[i][j].x4*sin(angi) + p[i][j].y4*sin(angi) + p[i][j].z4;
    }
  }

}

// scale given polygon
void scaln(V p[][20],float fact)
{
  int i,j;
  for(i=0;i<20;i++)
  {
   for(j = 0;j<20;j++)
   {
    p[i][j].x1=p[i][j].x1*fact;
    p[i][j].y1=p[i][j].y1*fact;
    p[i][j].z1=p[i][j].z1*fact;

    p[i][j].x2=p[i][j].x2*fact;
    p[i][j].y2=p[i][j].y2*fact;
    p[i][j].z2=p[i][j].z2*fact;

    p[i][j].x3=p[i][j].x3*fact;
    p[i][j].y3=p[i][j].y3*fact;
    p[i][j].z3=p[i][j].z3*fact;

    p[i][j].x4=p[i][j].x4*fact;
    p[i][j].y4=p[i][j].y4*fact;
    p[i][j].z4=p[i][j].z4*fact;

   }
  }
}

//rotate polygon
void rotn(V p[][20],float fact,int flag)
{
 int i,j;
 float t,angi;
 t = 3.142/180.0;
 angi = t*fact;

 if(flag == 2)//z-axis
 {
   for(i = 0;i<20;i++)
   {
     for(j = 0;j<20;j++)
     {
       p[i][j].x1=p[i][j].x1*cos(angi) - p[i][j].y1*sin(angi);
       p[i][j].y1=p[i][j].x1*sin(angi) + p[i][j].y1*cos(angi);
       p[i][j].z1=p[i][j].z1;

       p[i][j].x2=p[i][j].x2*cos(angi) - p[i][j].y2*sin(angi);
       p[i][j].y2=p[i][j].x2*sin(angi) + p[i][j].y2*cos(angi);
       p[i][j].z2=p[i][j].z2;

       p[i][j].x3=p[i][j].x3*cos(angi) - p[i][j].y3*sin(angi);
       p[i][j].y3=p[i][j].x3*sin(angi) + p[i][j].y3*cos(angi);
       p[i][j].z3=p[i][j].z3;

       p[i][j].x4=p[i][j].x4*cos(angi) - p[i][j].y4*sin(angi);
       p[i][j].y4=p[i][j].x4*sin(angi) + p[i][j].y4*cos(angi);
       p[i][j].z4=p[i][j].z4;

     }
   }
 }

 if(flag == 1)//y-axis
 {
   for(i = 0;i<20;i++)
   {
     for(j = 0;j<20;j++)
     {
	 p[i][j].x1=p[i][j].x1*cos(angi) + p[i][j].z1*sin(angi);
	 p[i][j].y1=p[i][j].y1;
	 p[i][j].z1=p[i][j].z1*cos(angi) - p[i][j].x1*sin(angi);

	 p[i][j].x2=p[i][j].x2*cos(angi) + p[i][j].z2*sin(angi);
	 p[i][j].y2=p[i][j].y2;
	 p[i][j].z2=p[i][j].z2*cos(angi) - p[i][j].x2*sin(angi);

	 p[i][j].x3=p[i][j].x3*cos(angi) + p[i][j].z3*sin(angi);
	 p[i][j].y3=p[i][j].y3;
	 p[i][j].z3=p[i][j].z3*cos(angi) - p[i][j].x3*sin(angi);

	 p[i][j].x4=p[i][j].x4*cos(angi) + p[i][j].z4*sin(angi);
	 p[i][j].y4=p[i][j].y4;
	 p[i][j].z4=p[i][j].z4*cos(angi) - p[i][j].x4*sin(angi);
     }
   }
 }

 if(flag == 1)//x-axis
 {
   for(i = 0;i<20;i++)
   {
     for(j = 0;j<20;j++)
     {
       p[i][j].x1=p[i][j].x1;
       p[i][j].y1=p[i][j].y1*cos(angi) - p[i][j].z1*sin(angi);
       p[i][j].z1=p[i][j].y1*sin(angi) + p[i][j].z1*cos(angi);

       p[i][j].x2=p[i][j].x2;
       p[i][j].y2=p[i][j].y2*cos(angi) - p[i][j].z2*sin(angi);
       p[i][j].z2=p[i][j].y2*sin(angi) + p[i][j].z2*cos(angi);

       p[i][j].x3=p[i][j].x3;
       p[i][j].y3=p[i][j].y3*cos(angi) - p[i][j].z3*sin(angi);
       p[i][j].z3=p[i][j].y3*sin(angi) + p[i][j].z3*cos(angi);

       p[i][j].x4=p[i][j].x4;
       p[i][j].y4=p[i][j].y4*cos(angi) - p[i][j].z4*sin(angi);
       p[i][j].z4=p[i][j].y4*sin(angi) + p[i][j].z4*cos(angi);

     }
   }
 }
}


//returns random displacement for fractal
float gauss()
{
  int i;
  float gauss = 0.0;
  randomize();
  for(i = 1;i<=6;i++)
  {
	gauss += rand()%2 - rand()%2;
	gauss /= 6;
  }
  return gauss;
}

//simple fractal function
void frac(V p[][20])
{
  int i,j;
  float var,oldval = 0.0,newval = 0.0;

  randomize();
  for(i = 1;i<19;i++)
  {
    for(j = 1;j<19;j++)
    {
//      var = gauss()*5.0;
//      var = var*30;
//      var += random(3);
//      if(random(2)>=1)
//      var += oldval;
//      else
//	   var -= oldval;
//      oldval = var;
//      var *= 10;

//      randomize();
      var = rand()%6;
      var -= 2;
//      newval = var*5;
      newval = var + oldval;
      oldval = newval;


      p[i][j].z3 = newval;
      p[i][j+1].z4 = newval;
      p[i+1][j+1].z1 = newval;
      p[i+1][j].z2 = newval;
    }
  }
}

//divided fractal function - still crude
void frac2(V p[][20])
{
  int i,j;
  float var,oldval = 0.0,newval = 0.0;
  int max_h = 6;

  randomize();
  for(i = 1;i<=10;i++)
  {
    for(j = 1;j<=10;j++)
    {
      var = rand()%max_h;
      var -= 2;
      var = var*i*10 + i*j;
      var /= 30;
      newval = var + oldval;
      oldval = newval;


      p[i][j].z3 = newval;
      p[i][j+1].z4 = newval;
      p[i+1][j+1].z1 = newval;
      p[i+1][j].z2 = newval;
    }
  }

  randomize();
  oldval = 0.0;
  newval = 0.0;

  for(i = 18;i>=10;i--)
  {
    for(j = 10;j>=1;j--)
    {
      var = rand()%max_h;
      var -= 2;
      var = var*i*10 + (i-10)*j;
      var /= 50;
      newval = var + oldval;
      oldval = newval;


      p[i][j].z3 = newval;
      p[i][j+1].z4 = newval;
      p[i+1][j+1].z1 = newval;
      p[i+1][j].z2 = newval;
    }
  }
  randomize();
  oldval = 0.0;
  newval = 0.0;
  for(i = 18;i>=10;i--)
  {
    for(j = 18;j>=10;j--)
    {
      var = rand()%max_h;
      var -= 2;
      var = var*i*10 + (i-10)*(j-10)/15;
      var /= 45;
      newval = var + oldval;
      oldval = newval;


      p[i][j].z3 = newval;
      p[i][j+1].z4 = newval;
      p[i+1][j+1].z1 = newval;
      p[i+1][j].z2 = newval;
    }
  }

  randomize();
  oldval = 0.0;
  newval = 0.0;

  for(i = 0;i<=10;i++)
  {
    for(j = 18;j>=10;j--)
    {
      var = rand()%max_h;
      var -= 2;
      var = var*i*10 + i*(j-10);
      var /= 30;
      newval = var + oldval;
      oldval = newval;


      p[i][j].z3 = newval;
      p[i][j+1].z4 = newval;
      p[i+1][j+1].z1 = newval;
      p[i+1][j].z2 = newval;
    }
  }

}

// initialise graphics and set color palette
void init_graph()
{
/* request auto detection */
int gdriver = DETECT, gmode, errorcode,i;
struct palettetype pal;

/* initialize graphics and local variables */
initgraph(&gdriver, &gmode, "");

/* read result of initialization */
errorcode = graphresult();
if (errorcode != grOk)  /* an error occurred */
{
      printf("Graphics error: %s\n", grapherrormsg(errorcode));
      printf("Press any key to halt:");
      getch();
      exit(1); /* terminate with an error code */
}

/* grab a copy of the palette */
getpalette(&pal);

/* create gray scale */
for (i=0; i<pal.size; i++)
      setrgbpalette(pal.colors[i], i*4+2, i*4, i*2);

}

void main(void)
{

 int i,j,k,ch,disp_flag,itern;
 float fact = 1.0,zrot = 1.0/*,xrot = 0.0*/,yrot = 1.0;
 V p[20][20];

 for(i = 0;i<20;i++)
 {
  for(j = 0;j<20;j++)
  {
    p[i][j].x1 = 20*(j-10);
    p[i][j].y1 = 20*(i-10);
    p[i][j].z1 = 0;

    p[i][j].x2 = 20*(j-10) + 20;
    p[i][j].y2 = 20*(i-10);
    p[i][j].z2 = 0;

    p[i][j].x3 = 20*(j-10) + 20;
    p[i][j].y3 = 20*(i-10) + 20;
    p[i][j].z3 = 0;

    p[i][j].x4 = 20*(j-10);
    p[i][j].y4 = 20*(i-10) + 20;
    p[i][j].z4 = 0;
  }
 }
  clrscr();
  printf("\n\n\n\t\t ****** 3D FRACTAL TERRAIN GENERATION ******\n");
  printf("\n\n Use following keys : \n");
  printf("\n\t 'a' & 'd' => To rotate arround 'z' axis");
  printf("\n\t 's' & 'w' => To rotate arround axis through x & y axes and in xy plane");
  printf("\n\t 'x' & 'z' => To zoom in and zoom out");
  printf("\n\t       'q' => To exit\n");
  printf("\n\n Complex Mesh ? (requires slightly more time) <y/n> : ");

  disp_flag = getche();
  if(disp_flag == 'y')
  {
    printf("\n Enter number of iterations for filling ( < 5) : ");
    scanf("%d",&itern);
  }

  init_graph();
  scaln(p,0.6);
  frac2(p);
  convert(p);
  if(disp_flag == 'y')
	  disp(p,1,itern);
  else
	  disp2(p,1);

  while((ch = getch())!='q')
  {
    if(ch == 'z')
    {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      fact += 0.01;
      scaln(p,fact);
    }
    else if(ch == 'x')
    {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      fact += -0.01;
      scaln(p,fact);
    }

   else if(ch == 'a')
   {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      zrot = 5.0;
      scaln(p,1.005);
      rotn(p,zrot,2);
    }

    else if(ch == 'd')
    {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      zrot = -5.0;
      scaln(p,1.005);
      rotn(p,zrot,2);
    }

   else if(ch == 'w')
   {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      yrot = 5.0;
      scaln(p,1.005);
      rotn(p,yrot,1);
    }
    else if(ch == 's')
    {
      if(disp_flag == 'y')
	  disp(p,0,itern);
      else
	  disp2(p,0);

      yrot = -5.0;
      scaln(p,1.005);
      rotn(p,yrot,1);
    }
    else if(ch == 0)
    {
     ch = getch();
     if(ch == 72)
     {
      //translate x +
     }
     if(ch == 80)
     {
      //translate x -
     }
     if(ch == 75)
     {
      //translate y+
     }

     if(ch == 77)
     {
      //translate y-
     }
    }
   convert(p);
   if(disp_flag == 'y')
	  disp(p,1,itern);
   else
	  disp2(p,1);
  }
  closegraph();
}
// end of main