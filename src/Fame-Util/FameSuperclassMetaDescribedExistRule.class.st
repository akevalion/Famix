Class {
	#name : #FameSuperclassMetaDescribedExistRule,
	#superclass : #RBBlockLintRule,
	#category : #'Fame-Util'
}

{ #category : #accessing }
FameSuperclassMetaDescribedExistRule class >> uniqueIdentifierName [
	^ 'SuperclassMetaDescribedExist'
]

{ #category : #running }
FameSuperclassMetaDescribedExistRule >> checkClass: aContext [
| class pragmas pragma substrings metaSuperclassName |

	class := aContext.
	pragmas := Pragma allNamed: #MSEClass:super: in: class.
	pragmas ifEmpty: [ ^ self ].
	pragmas size > 1 ifTrue: [ result addClass: class. ^ self ].
	
	pragma := pragmas first.
	metaSuperclassName := pragma argumentAt: 2.
	substrings := metaSuperclassName asString  substrings: #($.).
	
	substrings size > 1
		ifTrue: [
			Smalltalk at: (substrings first, substrings second) asSymbol  ifAbsent: [result addClass: class classSide selector: #annotation]
			]
		ifFalse: [
			Smalltalk at: substrings first asSymbol ifAbsent: [result addClass: class classSide selector: #annotation
			].
	].

]

{ #category : #accessing }
FameSuperclassMetaDescribedExistRule >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameSuperclassMetaDescribedExistRule >> name [

	^ 'The superclass defined in a FM3MetaDescription does not exist or is not well defined'
]

{ #category : #accessing }
FameSuperclassMetaDescribedExistRule >> rationale [

	^ 'check if a superclass defined in a FM3MetaDescription (generated by a class anoted with fm3 pragmas) exist and has the good declaration (name, 
package)'
]