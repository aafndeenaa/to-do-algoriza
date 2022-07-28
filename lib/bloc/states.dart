import 'package:flutter/material.dart';

abstract class TodoStates {}

class InitialStates extends TodoStates {}

class CreateDatabaseStates extends TodoStates {}

class InsertDatabaseStates extends TodoStates {}

class UpdateDatabaseState extends TodoStates {}

class DeleteDatabaseState extends TodoStates {}
