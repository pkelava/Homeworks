Definition andb (X Y : bool) : bool :=
  match X,Y with
    | _, true => X
    | _,false => false
  end.

Definition orb (X Y : bool) : bool :=
  match X,Y with
    | _,true => true
    | _,false => X
  end.

Definition notb (X : bool) : bool :=
  match X with
    | true => false
    | false => true
  end.

Notation "x * y" := (andb x y)(at level 40,left associativity).
Notation "x + y" := (orb x y)(at level 50,left associativity).

Lemma Prva (X Y : bool):
notb((X*Y)+(X*notb(Y))+(notb(X)*Y)) = notb(X+Y).
Proof. induction X, Y; reflexivity. Qed.

Lemma Druga (X Y Z : bool):
notb(notb(X)*notb(Y)*Z)*notb(notb(X)*Y*Z)*notb(X*notb(Y)*Z) = X*Y + notb(Z).
Proof. induction X, Y, Z; reflexivity. Qed.


