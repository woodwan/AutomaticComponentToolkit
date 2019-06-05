/*++

Copyright (C) 2019 Calculation developers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0-develop.

Abstract: This is an autogenerated CSharp application that demonstrates the
 usage of the CSharp bindings of Calculation library

Interface version: 1.0.0

*/


using System;
using System.Text;
using System.Runtime.InteropServices;

namespace Calculation_Example
{
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    unsafe public delegate int GetMethodType(byte[] p1, void** p2);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    unsafe public delegate Int32 GetVersionType(out UInt32 AMajor, out UInt32 AMinor, out UInt32 AMicro);

    class Calculation_Example
    {

        unsafe static void Main()
        {
            try
            {
                Calculation.Wrapper.loadLibrary();
                UInt32 nMajor, nMinor, nMicro;
                Calculation.Wrapper.GetVersion(out nMajor, out nMinor, out nMicro);
                string versionString = string.Format("Calculation.version = {0}.{1}.{2}", nMajor, nMinor, nMicro);
                Console.WriteLine(versionString);

                System.IntPtr method = Calculation.Wrapper.GetSymbolLookupMethod();

                Console.WriteLine(string.Format("Calculation.method = {0}", method));

                byte[] byteName = Encoding.UTF8.GetBytes("calculation_getversion" + char.MinValue);

                var funcptr = Marshal.GetDelegateForFunctionPointer<GetMethodType>(method);
                void* address;
                int ret = funcptr(byteName, &address);

                Console.WriteLine(string.Format("Calculation.retMethod = {0}", ret));

                var funcptrGetVersion = Marshal.GetDelegateForFunctionPointer<GetVersionType>(new IntPtr(address));
                nMajor = 5;
                nMinor = 5;
                nMicro = 6;
                funcptrGetVersion(out nMajor, out nMinor, out nMicro);
                versionString = string.Format("Calculation.version = {0}.{1}.{2}", nMajor, nMinor, nMicro);
                Console.WriteLine(versionString);


            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: \"" + e.Message + "\"");
            }
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
