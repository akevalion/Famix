Class {
	#name : #FamixTWithAnnotationTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAnnotationTypesTest',
	#classTraits : 'TFamixTWithAnnotationTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAnnotationTypesTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTWithAnnotationTypes).
self entity class initializeSlots: self entity.
]