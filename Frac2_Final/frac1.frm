VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "3D FRAC GEN : SIMPLE FRACTAL TERRAIN GENERATOR"
   ClientHeight    =   6555
   ClientLeft      =   2055
   ClientTop       =   570
   ClientWidth     =   8055
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.TextBox iterations 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   11280
      TabIndex        =   36
      Text            =   "3"
      Top             =   6400
      Width           =   375
   End
   Begin VB.Frame Frame5 
      Height          =   1335
      Left            =   3120
      TabIndex        =   28
      Top             =   6840
      Width           =   1455
      Begin VB.CommandButton cmdht 
         Caption         =   "Change Max Height Factor"
         Height          =   495
         Left            =   120
         TabIndex        =   30
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox maxheight 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   29
         Text            =   "0"
         Top             =   840
         Width           =   1215
      End
   End
   Begin VB.TextBox cellno 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   24
      Text            =   "16"
      Top             =   7680
      Width           =   495
   End
   Begin VB.CommandButton cmdabout 
      Caption         =   "About"
      Height          =   375
      Left            =   10920
      TabIndex        =   8
      Top             =   7080
      Width           =   735
   End
   Begin VB.CommandButton cmdexit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   10920
      TabIndex        =   7
      Top             =   7680
      Width           =   735
   End
   Begin VB.CommandButton cmdgen 
      Caption         =   "Generate"
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton cmdrotdn 
      Caption         =   "Rotate down"
      Height          =   375
      Left            =   9120
      TabIndex        =   5
      Top             =   7800
      Width           =   1215
   End
   Begin VB.CommandButton cmdrotup 
      Caption         =   "Rotate up"
      Height          =   375
      Left            =   9120
      TabIndex        =   4
      Top             =   6960
      Width           =   1215
   End
   Begin VB.CommandButton cmdrotleft 
      Caption         =   "Rotate left"
      Height          =   495
      Left            =   9000
      TabIndex        =   3
      Top             =   7320
      Width           =   735
   End
   Begin VB.CommandButton cmdrotrt 
      Caption         =   "Rotate right"
      Height          =   495
      Left            =   9720
      TabIndex        =   2
      Top             =   7320
      Width           =   735
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FF00FF&
      ForeColor       =   &H00C00000&
      Height          =   6255
      Left            =   120
      ScaleHeight     =   6195
      ScaleWidth      =   11595
      TabIndex        =   1
      ToolTipText     =   "Click and drag over the display area"
      Top             =   0
      Width           =   11655
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Display"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   7680
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Height          =   1335
      Left            =   120
      TabIndex        =   9
      Top             =   6840
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Height          =   1335
      Left            =   10800
      TabIndex        =   10
      Top             =   6840
      Width           =   975
   End
   Begin VB.Frame Frame3 
      Height          =   1335
      Left            =   4680
      TabIndex        =   11
      Top             =   6840
      Width           =   6015
      Begin VB.CommandButton cmdscale 
         Caption         =   " SCALE"
         Height          =   975
         Left            =   3480
         TabIndex        =   19
         Top             =   240
         Width           =   735
      End
      Begin VB.TextBox zzoom 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         TabIndex        =   18
         Text            =   "1"
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox yzoom 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2040
         TabIndex        =   17
         Text            =   "1"
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox xzoom 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1320
         TabIndex        =   16
         Text            =   "1"
         Top             =   840
         Width           =   615
      End
      Begin VB.CommandButton cmdtd 
         Caption         =   "v"
         Height          =   375
         Left            =   480
         TabIndex        =   15
         Top             =   840
         Width           =   375
      End
      Begin VB.CommandButton cmdtu 
         Caption         =   "^"
         Height          =   375
         Left            =   480
         TabIndex        =   14
         Top             =   240
         Width           =   375
      End
      Begin VB.CommandButton cmdtr 
         Caption         =   ">>"
         Height          =   255
         Left            =   840
         TabIndex        =   13
         Top             =   600
         Width           =   375
      End
      Begin VB.CommandButton cmdtl 
         Caption         =   "<<"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label4 
         Caption         =   "Z :"
         Height          =   255
         Left            =   2760
         TabIndex        =   23
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label3 
         Caption         =   "Y :"
         Height          =   255
         Left            =   2040
         TabIndex        =   22
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label2 
         Caption         =   "X :"
         Height          =   255
         Left            =   1320
         TabIndex        =   21
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label1 
         Caption         =   "Scaling Factors :"
         Height          =   255
         Left            =   1320
         TabIndex        =   20
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Frame Frame4 
      Height          =   1335
      Left            =   1560
      TabIndex        =   25
      Top             =   6840
      Width           =   1455
      Begin VB.CommandButton Command2 
         Caption         =   "Change number of cells "
         Height          =   495
         Left            =   120
         TabIndex        =   26
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label5 
         Caption         =   "    On         X & Y :"
         Height          =   375
         Left            =   120
         TabIndex        =   27
         Top             =   840
         Width           =   615
      End
   End
   Begin VB.Frame frmethod 
      Height          =   495
      Left            =   120
      TabIndex        =   31
      Top             =   6240
      Width           =   8655
      Begin VB.OptionButton optsin 
         Caption         =   "Random Noise With Sinusiod"
         Height          =   315
         Left            =   6000
         TabIndex        =   34
         Top             =   120
         Width           =   2415
      End
      Begin VB.OptionButton optsub 
         Caption         =   "Subdivision Algorithm"
         Height          =   315
         Left            =   120
         TabIndex        =   33
         Top             =   120
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.OptionButton optnoise 
         Caption         =   "Random Noise Algorithm"
         Height          =   315
         Left            =   2880
         TabIndex        =   32
         Top             =   120
         Width           =   2175
      End
   End
   Begin VB.CheckBox chkfill 
      Caption         =   "Fill Polygons"
      Height          =   255
      Left            =   9000
      TabIndex        =   35
      Top             =   6400
      Width           =   1215
   End
   Begin VB.Frame Frame6 
      Height          =   495
      Left            =   8880
      TabIndex        =   37
      Top             =   6240
      Width           =   2895
      Begin VB.Label Label6 
         Caption         =   "Iterations :"
         Height          =   255
         Left            =   1560
         TabIndex        =   38
         Top             =   180
         Width           =   855
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'************************************************************
'**                                                        **
'**             3D FRACTAL TERRAIN GENERATOR v1.1          **
'**                                                        **
'************************************************************
'*                                                          *
'*   BY ANIRUDDHA 'GOGIZMO' MARATHE                         *
'*   EMAIL :    anitemp84@yahoo.com                         *
'*   ( 'C' Source code for this program is also included)   *
'************************************************************

Option Explicit
Dim pt(256, 256) As Point
Dim x_offset, y_offset As Integer
Dim oldmx, oldmy
Dim maxno As Integer
Dim cnt As Integer

Private Sub Convert(p As Point)

p.fx = p.X * Cos(30 * 3.142 / 180) - p.Y * Cos(30 * 3.142 / 180)
p.fy = p.X * Sin(30 * 3.142 / 180) + p.Y * Sin(30 * 3.142 / 180) + p.z

End Sub
Private Sub rotn(p As Point, ang1 As Integer)

p.X = p.X * Cos(ang1 * 3.142 / 180) - p.Y * Sin(ang1 * 3.142 / 180)
p.Y = p.X * Sin(ang1 * 3.142 / 180) + p.Y * Cos(ang1 * 3.142 / 180)

End Sub

Private Sub rotud(p As Point, ang1 As Integer)

p.X = p.X * Cos(ang1 * 3.142 / 180) + p.z * Sin(ang1 * 3.142 / 180)
p.z = -p.X * Sin(ang1 * 3.142 / 180) + p.z * Cos(ang1 * 3.142 / 180)

End Sub

Private Sub gen1(bi1 As Integer, bi2 As Integer, bi3 As Integer, bi4 As Integer, iter As Integer)
    
If iter = 0 Then
    Exit Sub
Else
    pt((bi1 + bi3) / 2, (bi4 + bi2) / 2).z = -(pt(bi1, bi2).z + pt(bi3, bi4).z) / 2 - (((Rnd * 3) + 1) - 1) * 200 / 16 * 8
    Call gen1(bi1, bi2, (bi1 + bi3) / 2, (bi4 + bi2) / 2, iter - 1)
    Call gen1((bi1 + bi3) / 2, bi2, bi3, (bi4 + bi2) / 2, iter - 1)
    Call gen1(bi1, (bi4 + bi2) / 2, (bi1 + bi3) / 2, bi4, iter - 1)
    Call gen1((bi1 + bi3) / 2, (bi4 + bi2) / 2, bi3, bi4, iter - 1)
End If

End Sub

Private Sub chkfill_Click()
If chkfill.Value = 1 Then
MsgBox "Caution! This will make drawing slower !", vbExclamation, "Caution"
End If
End Sub

Private Sub cmdabout_Click()
Form2.Visible = True

End Sub

Private Sub cmdexit_Click()
End
End Sub
Private Sub find_exp(no As Integer)

Dim no1 As Integer

no1 = no
cnt = 0

While 1

If no1 / 2 <> 0 Then
    cnt = cnt + 1
Else
    Exit Sub
End If
no1 = no1 / 2
Wend
End Sub
Private Sub fill_poly(x1 As Double, y1 As Double, x2 As Double, y2 As Double, x3 As Double, y3 As Double, x4 As Double, y4 As Double, itern As Integer)
Dim x12, x34, y12, y34, x14, y14, x23, y23, x1234, y1234 As Double
If itern = 0 Then
    Exit Sub
Else
    x12 = (x1 + x2) / 2
    y12 = (y1 + y2) / 2
    x34 = (x3 + x4) / 2
    y34 = (y3 + y4) / 2
    x14 = (x1 + x4) / 2
    y14 = (y1 + y4) / 2
    x23 = (x2 + x3) / 2
    y23 = (y2 + y3) / 2
    x1234 = (x12 + x34) / 2
    y1234 = (y12 + y34) / 2
    
    
    Picture1.Line (x12, y12)-(x34, y34)
    Picture1.Line (x14, y14)-(x23, y23)
    
    Call fill_poly(x1, y1, Int(x12), Int(y12), Int(x1234), Int(y1234), Int(x14), Int(y14), itern - 1)
    Call fill_poly(x2, y2, Int(x12), Int(y12), Int(x1234), Int(y1234), Int(x23), Int(y23), itern - 1)
    Call fill_poly(x3, y3, Int(x23), Int(y23), Int(x1234), Int(y1234), Int(x34), Int(y34), itern - 1)
    Call fill_poly(x4, y4, Int(x34), Int(y34), Int(x1234), Int(y1234), Int(x14), Int(y14), itern - 1)
End If
End Sub


Private Sub cmdgen_Click()
Dim i, j
    
If optsub.Value = True Then
    Randomize
    pt(maxno / 2, maxno / 2).z = ((Rnd * 1000) + 1)
    Call find_exp(maxno)
    Call gen1(0, 0, maxno, maxno, cnt - 1)

For i = 0 To maxno
    For j = 0 To maxno
        If pt(i, j).z = 0 Then
            pt(i, j).z = -(((Rnd * 3) + 1) - 2) * 200 / maxno * 8 - (maxheight.Text) * 200
        End If
    Next j
Next i
End If

If optnoise.Value = True Then
    Randomize
        
    For i = 0 To maxno
        For j = 0 To maxno
            pt(i, j).z = (((Rnd * 1000) + 1) - 500) * (maxheight + 1) / 10
            
        Next j
    Next i

End If

If optsin.Value = True Then
Randomize
For i = 0 To maxno
    For j = 0 To maxno
        pt(i, j).z = Cos(i / maxno * 10) * 200 + Sin(j / maxno * 10) * 200 + (((Rnd * 1000) + 1) - 500) * (maxheight + 1) / 10
    Next j
Next i

End If

End Sub

Private Sub cmdht_Click()
Call Command2_Click
End Sub

Private Sub cmdrotdn_Click()
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        Call rotud(pt(i, j), -1)
    Next j
Next i

Call Command1_Click
End Sub

Private Sub cmdrotleft_Click()
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        Call rotn(pt(i, j), 1)
    Next j
Next i

Call Command1_Click
End Sub

Private Sub cmdrotrt_Click()
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        Call rotn(pt(i, j), -1)
    Next j
Next i

Call Command1_Click
End Sub

Private Sub cmdrotup_Click()
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        Call rotud(pt(i, j), 1)
    Next j
Next i

Call Command1_Click
End Sub
Private Sub scaln(fact_x As Double, fact_y As Double, fact_z As Double)
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        pt(i, j).X = pt(i, j).X * fact_x
        pt(i, j).Y = pt(i, j).Y * fact_y
        pt(i, j).z = pt(i, j).z * fact_z
    Next j
Next i

End Sub
Private Sub trans(fact_x As Double, fact_y As Double)
Dim i, j

For i = 0 To maxno
    For j = 0 To maxno
        pt(i, j).X = pt(i, j).X + fact_x
        pt(i, j).Y = pt(i, j).Y + fact_y
    Next j
Next i

End Sub

Private Sub cmdscale_Click()
Call scaln((xzoom.Text), (yzoom.Text), (zzoom.Text))
Call Command1_Click
End Sub

Private Sub cmdtd_Click()
Call trans(100, 100)
Call Command1_Click
End Sub

Private Sub cmdtl_Click()
Call trans(-100, 100)
Call Command1_Click
End Sub

Private Sub cmdtr_Click()
Call trans(100, -100)
Call Command1_Click
End Sub

Private Sub cmdtu_Click()
Call trans(-100, -100)
Call Command1_Click
End Sub

Private Sub Command1_Click()
Dim i, j

Picture1.Cls

For i = 0 To maxno
    For j = 0 To maxno
        Call Convert(pt(i, j))
        
    Next j
Next i

For i = 1 To maxno
    For j = 1 To maxno
        If pt(i, j).z < 1 Then
            Picture1.ForeColor = RGB(Abs(pt(i, j).z), Abs(pt(i, j).z), Abs(pt(i, j).z) * 4)
        Else
            Picture1.ForeColor = RGB(0, Abs(pt(i, j).z) * 4, Abs(pt(i, j).z) * 1)
        End If
            
        Picture1.Line (x_offset + pt(i - 1, j - 1).fx, y_offset + pt(i - 1, j - 1).fy)-(x_offset + pt(i - 1, j).fx, y_offset + pt(i - 1, j).fy)
        Picture1.Line (x_offset + pt(i - 1, j).fx, y_offset + pt(i - 1, j).fy)-(x_offset + pt(i, j).fx, y_offset + pt(i, j).fy)
        Picture1.Line (x_offset + pt(i, j).fx, y_offset + pt(i, j).fy)-(x_offset + pt(i, j - 1).fx, y_offset + pt(i, j - 1).fy)
        Picture1.Line (x_offset + pt(i, j - 1).fx, y_offset + pt(i, j - 1).fy)-(x_offset + pt(i - 1, j - 1).fx, y_offset + pt(i - 1, j - 1).fy)
        If chkfill.Value = 1 Then
            Call fill_poly(x_offset + pt(i, j).fx, y_offset + pt(i, j).fy, x_offset + pt(i - 1, j).fx, y_offset + pt(i - 1, j).fy, x_offset + pt(i - 1, j - 1).fx, y_offset + pt(i - 1, j - 1).fy, x_offset + pt(i, j - 1).fx, y_offset + pt(i, j - 1).fy, (iterations.Text))
        End If
    Next j
Next i

End Sub

Private Sub Command2_Click()
Call Form_Load
End Sub

Private Sub Form_Load()
Dim i, j
maxno = cellno.Text
x_offset = 6000
y_offset = 3500


For i = 0 To maxno
    For j = 0 To maxno
        pt(i, j).X = (j - maxno / 2) * 300 / maxno * 16
        pt(i, j).Y = (i - maxno / 2) * 300 / maxno * 16
        pt(i, j).z = 0
    Next j
Next i
End Sub



Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i, j
If Button = 1 Then

For i = 0 To maxno
    For j = 0 To maxno
        Call rotn(pt(i, j), 1)
    Next j
Next i


Call Command1_Click
End If
oldmx = X
oldmy = Y
End Sub

