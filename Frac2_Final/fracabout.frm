VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ABOUT"
   ClientHeight    =   2535
   ClientLeft      =   3900
   ClientTop       =   2355
   ClientWidth     =   4215
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2535
   ScaleWidth      =   4215
   Begin VB.CommandButton cmdok 
      BackColor       =   &H8000000B&
      Caption         =   "OK"
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   1800
      Width           =   3375
   End
   Begin VB.Frame fr2 
      BackColor       =   &H00FFC0FF&
      Caption         =   "3D FRACTAL TERRAIN GENERATOR"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   2535
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4215
      Begin VB.CommandButton Command1 
         BackColor       =   &H00FF0000&
         Caption         =   "Command1"
         Enabled         =   0   'False
         Height          =   735
         Left            =   360
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   1680
         Width           =   3615
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FF00FF&
         Caption         =   "Please Write To Me Your Valuable Suggestions Or Comments Or Any Modifications To This Program"
         Height          =   495
         Left            =   360
         TabIndex        =   4
         Top             =   1080
         Width           =   3615
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Caption         =   "Email : anitemp84@yahoo.com"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   360
         TabIndex        =   3
         Top             =   840
         Width           =   3615
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF8080&
         Caption         =   "               @@@ 3D FRAC GEN @@@                              By Anirudha ""GoGizmo"" Marathe"
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   360
         TabIndex        =   2
         Top             =   360
         Width           =   3615
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdok_Click()
Form2.Visible = False

End Sub
