using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.WindowsRuntime;
using Microsoft.UI.Xaml;
using Microsoft.UI.Xaml.Controls;
using Microsoft.UI.Xaml.Controls.Primitives;
using Microsoft.UI.Xaml.Data;
using Microsoft.UI.Xaml.Input;
using Microsoft.UI.Xaml.Media;
using Microsoft.UI.Xaml.Navigation;
using Windows.Foundation;
using Windows.Foundation.Collections;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace AnalizadorLexico
{
    /// <summary>
    /// An empty window that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainWindow : Window
    {
        public MainWindow()
        {
            this.InitializeComponent();
        }

        // Importamos la función analizarLexico desde el DLL
        [DllImport("lexer.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr analizarLexico(string input);

        // Importamos la función para liberar memoria
        [DllImport("lexer.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern void LiberarMemoria(IntPtr ptr);

        private void btnAnalizar_Click(object sender, RoutedEventArgs e)
        {
            // Obtenemos el texto de entrada
            string entrada = txtEntrada.Text;
            // Llamamos a la función del DLL
            IntPtr ptrResultado = analizarLexico(entrada);
            // Convertimos el puntero a cadena (asumiendo codificación ANSI)
            string resultado = Marshal.PtrToStringAnsi(ptrResultado);
            // Mostramos el resultado en el área de salida
            txtSalida.Text = resultado;
            // Liberamos la memoria asignada en el DLL
            LiberarMemoria(ptrResultado);
        }
    }
}
