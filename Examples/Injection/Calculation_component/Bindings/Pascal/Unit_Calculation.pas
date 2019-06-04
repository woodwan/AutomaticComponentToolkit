{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}
(*++

Copyright (C) 2019 Calculation developers

All rights reserved.

This file has been generated by the Automatic Component Toolkit (ACT) version 1.6.0-develop.

Abstract: This is an autogenerated Pascal Header file in order to allow an easy
 use of Calculation library

Interface version: 1.0.0

*)

unit Unit_Calculation;

interface

uses
  Unit_Numbers,
  {$IFDEF WINDOWS}
    Windows,
  {$ELSE}
    dynlibs,
  {$ENDIF}
  Types,
  Classes,
  SysUtils;

(*************************************************************************************************************************
 Version definition for Calculation
**************************************************************************************************************************)

const
  CALCULATION_VERSION_MAJOR = 1;
  CALCULATION_VERSION_MINOR = 0;
  CALCULATION_VERSION_MICRO = 0;
  CALCULATION_VERSION_PRERELEASEINFO = '';
  CALCULATION_VERSION_BUILDINFO = '';


(*************************************************************************************************************************
 General type definitions
**************************************************************************************************************************)

type
  TCalculationResult = Cardinal;
  TCalculationHandle = Pointer;

  PCalculationResult = ^TCalculationResult;
  PCalculationHandle = ^TCalculationHandle;

(*************************************************************************************************************************
 Error Constants for Calculation
**************************************************************************************************************************)

const
  CALCULATION_SUCCESS = 0;
  CALCULATION_ERROR_NOTIMPLEMENTED = 1;
  CALCULATION_ERROR_INVALIDPARAM = 2;
  CALCULATION_ERROR_INVALIDCAST = 3;
  CALCULATION_ERROR_BUFFERTOOSMALL = 4;
  CALCULATION_ERROR_GENERICEXCEPTION = 5;
  CALCULATION_ERROR_COULDNOTLOADLIBRARY = 6;
  CALCULATION_ERROR_COULDNOTFINDLIBRARYEXPORT = 7;
  CALCULATION_ERROR_INCOMPATIBLEBINARYVERSION = 8;


(*************************************************************************************************************************
 Declaration of handle classes 
**************************************************************************************************************************)

type
  TCalculationWrapper = class;
  TCalculationBase = class;
  TCalculationCalculator = class;


(*************************************************************************************************************************
 Function type definitions for Base
**************************************************************************************************************************)


(*************************************************************************************************************************
 Function type definitions for Calculator
**************************************************************************************************************************)

  (**
  * Adds a Variable to the list of Variables this calculator works on
  *
  * @param[in] pCalculator - Calculator instance.
  * @param[in] pVariable - The new variable in this calculator
  * @return error code or 0 (success)
  *)
  TCalculationCalculator_EnlistVariableFunc = function(pCalculator: TCalculationHandle; const pVariable: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Returns an instance of a enlisted variable
  *
  * @param[in] pCalculator - Calculator instance.
  * @param[in] nIndex - The index of the variable to query
  * @param[out] pVariable - The Index-th variable in this calculator
  * @return error code or 0 (success)
  *)
  TCalculationCalculator_GetEnlistedVariableFunc = function(pCalculator: TCalculationHandle; const nIndex: Cardinal; out pVariable: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Clears all variables in enlisted in this calculator
  *
  * @param[in] pCalculator - Calculator instance.
  * @return error code or 0 (success)
  *)
  TCalculationCalculator_ClearVariablesFunc = function(pCalculator: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Multiplies all enlisted variables
  *
  * @param[in] pCalculator - Calculator instance.
  * @param[out] pInstance - Variable that holds the product of all enlisted Variables
  * @return error code or 0 (success)
  *)
  TCalculationCalculator_MultiplyFunc = function(pCalculator: TCalculationHandle; out pInstance: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Sums all enlisted variables
  *
  * @param[in] pCalculator - Calculator instance.
  * @param[out] pInstance - Variable that holds the sum of all enlisted Variables
  * @return error code or 0 (success)
  *)
  TCalculationCalculator_AddFunc = function(pCalculator: TCalculationHandle; out pInstance: TCalculationHandle): TCalculationResult; cdecl;
  
(*************************************************************************************************************************
 Global function definitions 
**************************************************************************************************************************)

  (**
  * Creates a new Calculator instance
  *
  * @param[out] pInstance - New Calculator instance
  * @return error code or 0 (success)
  *)
  TCalculationCreateCalculatorFunc = function(out pInstance: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * retrieves the binary version of this library.
  *
  * @param[out] pMajor - returns the major version of this library
  * @param[out] pMinor - returns the minor version of this library
  * @param[out] pMicro - returns the micro version of this library
  * @return error code or 0 (success)
  *)
  TCalculationGetVersionFunc = function(out pMajor: Cardinal; out pMinor: Cardinal; out pMicro: Cardinal): TCalculationResult; cdecl;
  
  (**
  * Returns the last error recorded on this object
  *
  * @param[in] pInstance - Instance Handle
  * @param[in] nErrorMessageBufferSize - size of the buffer (including trailing 0)
  * @param[out] pErrorMessageNeededChars - will be filled with the count of the written bytes, or needed buffer size.
  * @param[out] pErrorMessageBuffer -  buffer of Message of the last error, may be NULL
  * @param[out] pHasError - Is there a last error to query
  * @return error code or 0 (success)
  *)
  TCalculationGetLastErrorFunc = function(const pInstance: TCalculationHandle; const nErrorMessageBufferSize: Cardinal; out pErrorMessageNeededChars: Cardinal; pErrorMessageBuffer: PAnsiChar; out pHasError: Byte): TCalculationResult; cdecl;
  
  (**
  * Releases shared ownership of an Instance
  *
  * @param[in] pInstance - Instance Handle
  * @return error code or 0 (success)
  *)
  TCalculationReleaseInstanceFunc = function(const pInstance: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Acquires shared ownership of an Instance
  *
  * @param[in] pInstance - Instance Handle
  * @return error code or 0 (success)
  *)
  TCalculationAcquireInstanceFunc = function(const pInstance: TCalculationHandle): TCalculationResult; cdecl;
  
  (**
  * Injects an imported component for usage within this component
  *
  * @param[in] pNameSpace - NameSpace of the injected component
  * @param[in] pSymbolAddressMethod - Address of the SymbolAddressMethod of the injected component
  * @return error code or 0 (success)
  *)
  TCalculationInjectComponentFunc = function(const pNameSpace: PAnsiChar; const pSymbolAddressMethod: Pointer): TCalculationResult; cdecl;
  
  (**
  * Returns the address of the SymbolLookupMethod
  *
  * @param[out] pSymbolLookupMethod - Address of the SymbolAddressMethod
  * @return error code or 0 (success)
  *)
  TCalculationGetSymbolLookupMethodFunc = function(out pSymbolLookupMethod: Pointer): TCalculationResult; cdecl;
  

(*************************************************************************************************************************
 Helper function pointer definitions 
**************************************************************************************************************************)
TCalculationSymbolLookupMethod = function(const pSymbolName: PAnsiChar; out pValue: Pointer): TCalculationResult; cdecl;

(*************************************************************************************************************************
 Exception definition
**************************************************************************************************************************)

  ECalculationException = class(Exception)
  private
    FErrorCode: TCalculationResult;
    FCustomMessage: String;
  public
    property ErrorCode: TCalculationResult read FErrorCode;
    property CustomMessage: String read FCustomMessage;
    constructor Create(AErrorCode: TCalculationResult; AMessage: String);
    constructor CreateCustomMessage(AErrorCode: TCalculationResult; AMessage: String);
  end;


(*************************************************************************************************************************
 Class definition for Base
**************************************************************************************************************************)

 TCalculationBase = class(TObject)
  private
    FWrapper: TCalculationWrapper;
    FHandle: TCalculationHandle;
  public
    constructor Create(AWrapper: TCalculationWrapper; AHandle: TCalculationHandle);
    destructor Destroy; override;
    property TheHandle: TCalculationHandle read FHandle;
  end;


(*************************************************************************************************************************
 Class definition for Calculator
**************************************************************************************************************************)

  TCalculationCalculator = class(TCalculationBase)
  public
    constructor Create(AWrapper: TCalculationWrapper; AHandle: TCalculationHandle);
    destructor Destroy; override;
    procedure EnlistVariable(const AVariable: TNumbersVariable);
    function GetEnlistedVariable(const AIndex: Cardinal): TNumbersVariable;
    procedure ClearVariables();
    function Multiply(): TNumbersVariable;
    function Add(): TNumbersVariable;
  end;

(*************************************************************************************************************************
 Wrapper definition
**************************************************************************************************************************)

  TCalculationWrapper = class(TObject)
  private
    FModule: HMODULE;
    // Imported Components
    FNumbersWrapper: TNumbersWrapper;
    
    FCalculationCalculator_EnlistVariableFunc: TCalculationCalculator_EnlistVariableFunc;
    FCalculationCalculator_GetEnlistedVariableFunc: TCalculationCalculator_GetEnlistedVariableFunc;
    FCalculationCalculator_ClearVariablesFunc: TCalculationCalculator_ClearVariablesFunc;
    FCalculationCalculator_MultiplyFunc: TCalculationCalculator_MultiplyFunc;
    FCalculationCalculator_AddFunc: TCalculationCalculator_AddFunc;
    FCalculationCreateCalculatorFunc: TCalculationCreateCalculatorFunc;
    FCalculationGetVersionFunc: TCalculationGetVersionFunc;
    FCalculationGetLastErrorFunc: TCalculationGetLastErrorFunc;
    FCalculationReleaseInstanceFunc: TCalculationReleaseInstanceFunc;
    FCalculationAcquireInstanceFunc: TCalculationAcquireInstanceFunc;
    FCalculationInjectComponentFunc: TCalculationInjectComponentFunc;
    FCalculationGetSymbolLookupMethodFunc: TCalculationGetSymbolLookupMethodFunc;

    {$IFDEF MSWINDOWS}
    function LoadFunction(AFunctionName: AnsiString; FailIfNotExistent: Boolean = True): FARPROC;
    {$ELSE}
    function LoadFunction(AFunctionName: AnsiString; FailIfNotExistent: Boolean = True): Pointer;
    {$ENDIF MSWINDOWS}

    procedure checkBinaryVersion();

    // Imported Components
    function GetNumbersWrapper(): TNumbersWrapper;
    
  protected
    property CalculationCalculator_EnlistVariableFunc: TCalculationCalculator_EnlistVariableFunc read FCalculationCalculator_EnlistVariableFunc;
    property CalculationCalculator_GetEnlistedVariableFunc: TCalculationCalculator_GetEnlistedVariableFunc read FCalculationCalculator_GetEnlistedVariableFunc;
    property CalculationCalculator_ClearVariablesFunc: TCalculationCalculator_ClearVariablesFunc read FCalculationCalculator_ClearVariablesFunc;
    property CalculationCalculator_MultiplyFunc: TCalculationCalculator_MultiplyFunc read FCalculationCalculator_MultiplyFunc;
    property CalculationCalculator_AddFunc: TCalculationCalculator_AddFunc read FCalculationCalculator_AddFunc;
    property CalculationCreateCalculatorFunc: TCalculationCreateCalculatorFunc read FCalculationCreateCalculatorFunc;
    property CalculationGetVersionFunc: TCalculationGetVersionFunc read FCalculationGetVersionFunc;
    property CalculationGetLastErrorFunc: TCalculationGetLastErrorFunc read FCalculationGetLastErrorFunc;
    property CalculationReleaseInstanceFunc: TCalculationReleaseInstanceFunc read FCalculationReleaseInstanceFunc;
    property CalculationAcquireInstanceFunc: TCalculationAcquireInstanceFunc read FCalculationAcquireInstanceFunc;
    property CalculationInjectComponentFunc: TCalculationInjectComponentFunc read FCalculationInjectComponentFunc;
    property CalculationGetSymbolLookupMethodFunc: TCalculationGetSymbolLookupMethodFunc read FCalculationGetSymbolLookupMethodFunc;
    procedure CheckError(AInstance: TCalculationBase; AErrorCode: TCalculationResult);
  public
    constructor Create(ADLLName: String);
    constructor CreateFromSymbolLookupMethod(ALookupMethod: TCalculationSymbolLookupMethod);
    destructor Destroy; override;
    // Imported Components
    property NumbersWrapper: TNumbersWrapper read GetNumbersWrapper;
    
    function CreateCalculator(): TCalculationCalculator;
    procedure GetVersion(out AMajor: Cardinal; out AMinor: Cardinal; out AMicro: Cardinal);
    function GetLastError(const AInstance: TCalculationBase; out AErrorMessage: String): Boolean;
    procedure ReleaseInstance(const AInstance: TCalculationBase);
    procedure AcquireInstance(const AInstance: TCalculationBase);
    procedure InjectComponent(const ANameSpace: String; const ASymbolAddressMethod: Pointer);
    function GetSymbolLookupMethod(): Pointer;
  end;


implementation


(*************************************************************************************************************************
 Exception implementation
**************************************************************************************************************************)

  constructor ECalculationException.Create(AErrorCode: TCalculationResult; AMessage: String);
  var
    ADescription: String;
  begin
    FErrorCode := AErrorCode;
    case FErrorCode of
      CALCULATION_ERROR_NOTIMPLEMENTED: ADescription := 'functionality not implemented';
      CALCULATION_ERROR_INVALIDPARAM: ADescription := 'an invalid parameter was passed';
      CALCULATION_ERROR_INVALIDCAST: ADescription := 'a type cast failed';
      CALCULATION_ERROR_BUFFERTOOSMALL: ADescription := 'a provided buffer is too small';
      CALCULATION_ERROR_GENERICEXCEPTION: ADescription := 'a generic exception occurred';
      CALCULATION_ERROR_COULDNOTLOADLIBRARY: ADescription := 'the library could not be loaded';
      CALCULATION_ERROR_COULDNOTFINDLIBRARYEXPORT: ADescription := 'a required exported symbol could not be found in the library';
      CALCULATION_ERROR_INCOMPATIBLEBINARYVERSION: ADescription := 'the version of the binary interface does not match the bindings interface';
      else
        ADescription := 'unknown';
    end;

    inherited Create(Format('Calculation library Error - %s (#%d, %s)', [ ADescription, AErrorCode, AMessage ]));
  end;

  constructor ECalculationException.CreateCustomMessage(AErrorCode: TCalculationResult; AMessage: String);
  begin
    FCustomMessage := AMessage;
    FErrorCode := AErrorCode;
    inherited Create(Format('%s (%d)', [FCustomMessage, AErrorCode]));
  end;

(*************************************************************************************************************************
 Class implementation for Base
**************************************************************************************************************************)

  constructor TCalculationBase.Create(AWrapper: TCalculationWrapper; AHandle: TCalculationHandle);
  begin
    if not Assigned(AWrapper) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM, '');
    if not Assigned(AHandle) then
      raise ECalculationException.Create(CALCULATION_ERROR_INVALIDPARAM, '');

    inherited Create();
    FWrapper := AWrapper;
    FHandle := AHandle;
  end;

  destructor TCalculationBase.Destroy;
  begin
    FWrapper.ReleaseInstance(self);
    inherited;
  end;

(*************************************************************************************************************************
 Class implementation for Calculator
**************************************************************************************************************************)

  constructor TCalculationCalculator.Create(AWrapper: TCalculationWrapper; AHandle: TCalculationHandle);
  begin
    inherited Create(AWrapper, AHandle);
  end;

  destructor TCalculationCalculator.Destroy;
  begin
    inherited;
  end;

  procedure TCalculationCalculator.EnlistVariable(const AVariable: TNumbersVariable);
  begin
    if not Assigned(AVariable) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_INVALIDPARAM, 'AVariable is a nil value.');
    FWrapper.CheckError(Self, FWrapper.CalculationCalculator_EnlistVariableFunc(FHandle, AVariable.TheHandle));
  end;

  function TCalculationCalculator.GetEnlistedVariable(const AIndex: Cardinal): TNumbersVariable;
  var
    HVariable: TCalculationHandle;
  begin
    Result := nil;
    HVariable := nil;
    FWrapper.CheckError(Self, FWrapper.CalculationCalculator_GetEnlistedVariableFunc(FHandle, AIndex, HVariable));
    if Assigned(HVariable) then
      Result := TNumbersVariable.Create(FWrapper.NumbersWrapper, HVariable);
  end;

  procedure TCalculationCalculator.ClearVariables();
  begin
    FWrapper.CheckError(Self, FWrapper.CalculationCalculator_ClearVariablesFunc(FHandle));
  end;

  function TCalculationCalculator.Multiply(): TNumbersVariable;
  var
    HInstance: TCalculationHandle;
  begin
    Result := nil;
    HInstance := nil;
    FWrapper.CheckError(Self, FWrapper.CalculationCalculator_MultiplyFunc(FHandle, HInstance));
    if Assigned(HInstance) then
      Result := TNumbersVariable.Create(FWrapper.NumbersWrapper, HInstance);
  end;

  function TCalculationCalculator.Add(): TNumbersVariable;
  var
    HInstance: TCalculationHandle;
  begin
    Result := nil;
    HInstance := nil;
    FWrapper.CheckError(Self, FWrapper.CalculationCalculator_AddFunc(FHandle, HInstance));
    if Assigned(HInstance) then
      Result := TNumbersVariable.Create(FWrapper.NumbersWrapper, HInstance);
  end;

(*************************************************************************************************************************
 Wrapper class implementation
**************************************************************************************************************************)

  constructor TCalculationWrapper.Create(ADLLName: String);
  {$IFDEF MSWINDOWS}
  var
    AWideString: WideString;
  {$ENDIF MSWINDOWS}
  begin
    inherited Create;
    
    FNumbersWrapper := nil;
    
    {$IFDEF MSWINDOWS}
      AWideString := UTF8Decode(ADLLName + #0);
      FModule := LoadLibraryW(PWideChar(AWideString));
    {$ELSE}
      FModule := dynlibs.LoadLibrary(ADLLName);
    {$ENDIF MSWINDOWS}
    if FModule = 0 then
      raise ECalculationException.Create(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');

    FCalculationCalculator_EnlistVariableFunc := LoadFunction('calculation_calculator_enlistvariable');
    FCalculationCalculator_GetEnlistedVariableFunc := LoadFunction('calculation_calculator_getenlistedvariable');
    FCalculationCalculator_ClearVariablesFunc := LoadFunction('calculation_calculator_clearvariables');
    FCalculationCalculator_MultiplyFunc := LoadFunction('calculation_calculator_multiply');
    FCalculationCalculator_AddFunc := LoadFunction('calculation_calculator_add');
    FCalculationCreateCalculatorFunc := LoadFunction('calculation_createcalculator');
    FCalculationGetVersionFunc := LoadFunction('calculation_getversion');
    FCalculationGetLastErrorFunc := LoadFunction('calculation_getlasterror');
    FCalculationReleaseInstanceFunc := LoadFunction('calculation_releaseinstance');
    FCalculationAcquireInstanceFunc := LoadFunction('calculation_acquireinstance');
    FCalculationInjectComponentFunc := LoadFunction('calculation_injectcomponent');
    FCalculationGetSymbolLookupMethodFunc := LoadFunction('calculation_getsymbollookupmethod');
    
    checkBinaryVersion();
  end;

  constructor TCalculationWrapper.CreateFromSymbolLookupMethod(ALookupMethod: TCalculationSymbolLookupMethod);
  var
    AResult : TCalculationResult;
  begin
    inherited Create;
    
    FNumbersWrapper := nil;
    
    AResult := ALookupMethod(PAnsiChar('calculation_calculator_enlistvariable'), @FCalculationCalculator_EnlistVariableFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_calculator_getenlistedvariable'), @FCalculationCalculator_GetEnlistedVariableFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_calculator_clearvariables'), @FCalculationCalculator_ClearVariablesFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_calculator_multiply'), @FCalculationCalculator_MultiplyFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_calculator_add'), @FCalculationCalculator_AddFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_createcalculator'), @FCalculationCreateCalculatorFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_getversion'), @FCalculationGetVersionFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_getlasterror'), @FCalculationGetLastErrorFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_releaseinstance'), @FCalculationReleaseInstanceFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_acquireinstance'), @FCalculationAcquireInstanceFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_injectcomponent'), @FCalculationInjectComponentFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    AResult := ALookupMethod(PAnsiChar('calculation_getsymbollookupmethod'), @FCalculationGetSymbolLookupMethodFunc);
    if AResult <> CALCULATION_SUCCESS then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTLOADLIBRARY, '');
    
    checkBinaryVersion();
  end;

  destructor TCalculationWrapper.Destroy;
  begin
    {$IFDEF MSWINDOWS}
      if FModule <> 0 then
        FreeLibrary(FModule);
    {$ELSE}
      if FModule <> 0 then
        UnloadLibrary(FModule);
    {$ENDIF MSWINDOWS}
    inherited;
  end;

  procedure TCalculationWrapper.CheckError(AInstance: TCalculationBase; AErrorCode: TCalculationResult);
  var
    AErrorMessage: String;
  begin
    if AInstance <> nil then begin
      if AInstance.FWrapper <> Self then
        raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_INVALIDCAST, 'invalid wrapper call');
    end;
    if AErrorCode <> CALCULATION_SUCCESS then begin
      AErrorMessage := '';
      if Assigned(AInstance) then
        GetLastError(AInstance, AErrorMessage);
      raise ECalculationException.Create(AErrorCode, AErrorMessage);
    end;
  end;

  {$IFDEF MSWINDOWS}
  function TCalculationWrapper.LoadFunction(AFunctionName: AnsiString; FailIfNotExistent: Boolean): FARPROC;
  begin
    Result := GetProcAddress(FModule, PAnsiChar(AFunctionName));
    if FailIfNotExistent and not Assigned(Result) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTFINDLIBRARYEXPORT, 'could not find function ' + AFunctionName);
  end;
  {$ELSE}
  function TCalculationWrapper.LoadFunction(AFunctionName: AnsiString; FailIfNotExistent: Boolean): Pointer;
  begin
    Result := dynlibs.GetProcAddress(FModule, AFunctionName);
    if FailIfNotExistent and not Assigned(Result) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_COULDNOTFINDLIBRARYEXPORT, 'could not find function ' + AFunctionName);
  end;
  {$ENDIF MSWINDOWS}

  procedure TCalculationWrapper.checkBinaryVersion();
  var
    AMajor, AMinor, AMicro: Cardinal;
  begin
    GetVersion(AMajor, AMinor, AMicro);
    if (AMajor <> CALCULATION_VERSION_MAJOR) then
      raise ECalculationException.Create(CALCULATION_ERROR_INCOMPATIBLEBINARYVERSION, '');
  end;
  
    // Imported Components
  function TCalculationWrapper.GetNumbersWrapper(): TNumbersWrapper;
  begin
    if not Assigned(FNumbersWrapper) then
      raise ECalculationException.Create(CALCULATION_ERROR_COULDNOTLOADLIBRARY, 'Injected library Numbers has not yet been loaded.');
    result := FNumbersWrapper;
  end;
    
  function TCalculationWrapper.CreateCalculator(): TCalculationCalculator;
  var
    HInstance: TCalculationHandle;
  begin
    Result := nil;
    HInstance := nil;
    CheckError(nil, CalculationCreateCalculatorFunc(HInstance));
    if Assigned(HInstance) then
      Result := TCalculationCalculator.Create(Self, HInstance);
  end;

  procedure TCalculationWrapper.GetVersion(out AMajor: Cardinal; out AMinor: Cardinal; out AMicro: Cardinal);
  begin
    CheckError(nil, CalculationGetVersionFunc(AMajor, AMinor, AMicro));
  end;

  function TCalculationWrapper.GetLastError(const AInstance: TCalculationBase; out AErrorMessage: String): Boolean;
  var
    bytesNeededErrorMessage: Cardinal;
    bytesWrittenErrorMessage: Cardinal;
    bufferErrorMessage: array of Char;
    ResultHasError: Byte;
  begin
    if not Assigned(AInstance) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_INVALIDPARAM, 'AInstance is a nil value.');
    bytesNeededErrorMessage:= 0;
    bytesWrittenErrorMessage:= 0;
    ResultHasError := 0;
    CheckError(nil, CalculationGetLastErrorFunc(AInstance.TheHandle, 0, bytesNeededErrorMessage, nil, ResultHasError));
    SetLength(bufferErrorMessage, bytesNeededErrorMessage);
    CheckError(nil, CalculationGetLastErrorFunc(AInstance.TheHandle, bytesNeededErrorMessage, bytesWrittenErrorMessage, @bufferErrorMessage[0], ResultHasError));
    AErrorMessage := StrPas(@bufferErrorMessage[0]);
    Result := (ResultHasError <> 0);
  end;

  procedure TCalculationWrapper.ReleaseInstance(const AInstance: TCalculationBase);
  begin
    if not Assigned(AInstance) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_INVALIDPARAM, 'AInstance is a nil value.');
    CheckError(nil, CalculationReleaseInstanceFunc(AInstance.TheHandle));
  end;

  procedure TCalculationWrapper.AcquireInstance(const AInstance: TCalculationBase);
  begin
    if not Assigned(AInstance) then
      raise ECalculationException.CreateCustomMessage(CALCULATION_ERROR_INVALIDPARAM, 'AInstance is a nil value.');
    CheckError(nil, CalculationAcquireInstanceFunc(AInstance.TheHandle));
  end;

  procedure TCalculationWrapper.InjectComponent(const ANameSpace: String; const ASymbolAddressMethod: Pointer);
  var
    ANameSpaceFound: boolean;
  begin
    CheckError(nil, CalculationInjectComponentFunc(PAnsiChar(ANameSpace), ASymbolAddressMethod));
    ANameSpaceFound := False;
    if (ANameSpace = 'Numbers') then begin
      if assigned(FNumbersWrapper) then
        raise ECalculationException.Create(CALCULATION_ERROR_COULDNOTLOADLIBRARY, 'Library with namespace ' + ANameSpace + ' is already registered.');
      FNumbersWrapper := TNumbersWrapper.CreateFromSymbolLookupMethod(ASymbolAddressMethod);
      ANameSpaceFound := True;
    end;
      if not ANameSpaceFound then
      raise ECalculationException.Create(CALCULATION_ERROR_COULDNOTLOADLIBRARY, 'Unknown namespace ' + ANameSpace);
   
  end;

  function TCalculationWrapper.GetSymbolLookupMethod(): Pointer;
  begin
    CheckError(nil, CalculationGetSymbolLookupMethodFunc(Result));
  end;


end.