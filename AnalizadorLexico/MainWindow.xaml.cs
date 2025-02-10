using System;
using System.Runtime.InteropServices;
using Microsoft.UI.Xaml;


namespace AnalizadorLexico
{
    public sealed partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        [DllImport("lexer.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr analizarLexico(string input);

        [DllImport("lexer.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern void LiberarMemoria(IntPtr ptr);

        private void btnAnalizar_Click(object sender, RoutedEventArgs e)
        {
            string entrada = txtEntrada.Text;
            IntPtr ptrResultado = analizarLexico(entrada);
            string resultado = Marshal.PtrToStringAnsi(ptrResultado);
            txtSalida.Text = resultado;
            LiberarMemoria(ptrResultado);
        }
    }
}
