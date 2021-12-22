
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-pregnant ""

   (logical (start))

   =>

   (assert (UI-state (display PregnantQuestion)
                     (relation-asserted pregnant)
                     (response No)
                     (valid-answers No Yes During SheThought))))
   
(defrule determine-black ""

   (logical (pregnant Yes))

   =>

   (assert (UI-state (display BlackQuestion)
                     (relation-asserted black)
                     (response White)
                     (valid-answers White Yes Barely))))

(defrule determine-kids ""

   (logical (pregnant No))

   =>

   (assert (UI-state (display KidsQuestion)
                     (relation-asserted kids)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-pregnant-happy ""

   (logical (pregnant SheThought))

   =>

   (assert (UI-state (display PregnantHappyQuestion)
                     (relation-asserted pregnant-happy)
                     (response No)
                     (valid-answers No Lizzed))))
   
(defrule determine-zombies ""

   (logical (black Yes))

   =>

   (assert (UI-state (display ZombiesQuestion)
                     (relation-asserted zombies)
                     (response No)
                     (valid-answers No Yes Employees))))

(defrule determine-northeast ""

   (logical (kids Yes))

   =>

   (assert (UI-state (display NortheastQuestion)
                     (relation-asserted northeast)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-queen ""

   (logical (northeast Yes))

   =>

   (assert (UI-state (display QueenQuestion)
                     (relation-asserted queen)
                     (response No)
                     (valid-answers No Yes ExWife))))

(defrule determine-diaper ""

   (logical (northeast No))

   =>

   (assert (UI-state (display DiaperQuestion)
                     (relation-asserted diaper)
                     (response No)
                     (valid-answers No Unfortunately))))

(defrule determine-girl ""

   (logical (pregnant-happy No))

   =>

   (assert (UI-state (display PregnantHappyGirlQuestion)
                     (relation-asserted girl)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-real-zombies ""

    (logical (zombies Yes))

    =>

    (assert (UI-state (display RealZombiesQuestion)
                      (relation-asserted real-zombies)
                      (response No)
                      (valid-answers No ZombiesAllTheTime))))

(defrule determine-wealth ""
  
   (logical (diaper Unfortunately))

   =>
   
   (assert (UI-state (display RichQuestion)
                     (relation-asserted wealth)
                     (response Poor)
                     (valid-answers Poor Rich))))

(defrule determine-adorkable ""

   (logical (girl Yes))

   =>

   (assert (UI-state (display AdorkableQuestion)
                     (relation-asserted adorkable)
                     (response No)
                     (valid-answers No Adorkable))))

(defrule determine-shot ""

   (logical (zombies No))

   =>

   (assert (UI-state (display ShotQuestion)
                     (relation-asserted shot)
                     (response Never)
                     (valid-answers Never EverySoOften ShootingAllTheTime))))

(defrule determine-phones ""

   (logical (black Barely))

   =>

   (assert (UI-state (display CellPhoneQuestion)
                     (relation-asserted phones)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cars ""

   (logical (phones No))

   =>

   (assert (UI-state (display CarsQuestion)
                     (relation-asserted cars)
                     (response Horses)
                     (valid-answers Horses Luxurious))))

(defrule determine-agency ""

   (logical (kids No))

   =>

   (assert (UI-state (display GovernmentQuestion)
                     (relation-asserted agency)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-sing ""

   (logical (shot Never))

   =>

   (assert (UI-state (display SingQuestion)
                     (relation-asserted sing)
                     (response NoGod)
                     (valid-answers NoGod BigTime))))

(defrule determine-spy ""

   (logical (agency Yes))

   =>

   (assert (UI-state (display SpyQuestion)
                     (relation-asserted spy)
                     (response No)
                     (valid-answers No NotAtLiberty Danger))))

(defrule determine-sports ""

   (logical (phones Yes))

   =>

   (assert (UI-state (display SportsQuestion)
                     (relation-asserted sports)
                     (response No)
                     (valid-answers No Yes))))


(defrule determine-covers ""

   (logical (sing Yes))

   =>

   (assert (UI-state (display CoversQuestion)
                     (relation-asserted covers)
                     (response Originals)
                     (valid-answers Originals Covers))))

(defrule determine-fantasy ""

   (logical (sports Yes))

   =>

   (assert (UI-state (display RealSportsQuestion)
                     (relation-asserted fantasy)
                     (response Real)
                     (valid-answers Real Fantasy))))

(defrule determine-apartment ""

   (logical (agency No))

   =>

   (assert (UI-state (display ApartmentQuestion)
                     (relation-asserted apartment)
                     (response Nope)
                     (valid-answers Nope Loft))))

(defrule determine-haunted ""

   (logical (sports No))

   =>

   (assert (UI-state (display HauntedQuestion)
                     (relation-asserted haunted)
                     (response Nothing)
                     (valid-answers Nothing Everything Soul))))

(defrule determine-cupcakes ""

   (logical (apartment Loft))

   =>

   (assert (UI-state (display CupcakesQuestion)
                     (relation-asserted cupcakes)
                     (response Amazing
                     (valid-answers Amazing YouKnowIt James))))

(defrule determine-mother ""

   (logical (haunted Nothing))

   =>

   (assert (UI-state (display MotherQuestion)
                     (relation-asserted mother)
                     (response NoComeOn)
                     (valid-answers NoComeOn Weird))))

(defrule determine-sketch ""

   (logical (apartment Nope))

   =>

   (assert (UI-state (display SketchQuestion)
                     (relation-asserted sketch)
                     (response Dummy)
                     (valid-answers Dummy Nailed))))

(defrule determine-hipsters ""

   (logical (sketch Nailed))

   =>

   (assert (UI-state (display HipstersQuestion)
                     (relation-asserted hipsters)
                     (response No)
                     (valid-answers No YesNetflix))))

(defrule determine-weed ""

   (logical (sketch Dummy))

   =>

   (assert (UI-state (display WeedQuestion)
                     (relation-asserted weed)
                     (response No)
                     (valid-answers No Bewrl))))


;;;****************
;;;* SHOW RULES *
;;;****************

(defrule doctor-who ""

   (logical (pregnant During))
   
   =>

   (assert (UI-state (display Doctor)
                     (state final))))

(defrule downton ""

   (logical (black White))

   =>

   (assert (UI-state (display Downton)
                     (state final))))

(defrule rock ""

   (logical (pregnant-happy Lizzed))

   =>

   (assert (UI-state (display Rock)
                     (state final))))

(defrule office ""

   (logical (zombies Employees))

   =>

   (assert (UI-state (display Office)
                     (state final))))

(defrule bob ""

   (logical (queen No))

   =>

   (assert (UI-state (display Bob)
                     (state final))))

(defrule louie ""

   (logical (queen ExWife))

   =>

   (assert (UI-state (display Louie)
                     (state final))))

(defrule once ""

   (logical (queen Yes))

   =>

   (assert (UI-state (display Once)
                     (state final))))

(defrule nashville ""

   (logical (diaper No))

   =>

   (assert (UI-state (display Nashville)
                     (state final))))

(defrule veep ""

   (logical (girl No))

   =>

   (assert (UI-state (display Veep)
                     (state final))))

(defrule dead ""

   (logical (real-zombies ZombiesAllTheTime))

   =>

   (assert (UI-state (display Dead)
                     (state final))))

(defrule community ""

   (logical (real-zombies No))

   =>

   (assert (UI-state (display Community)
                     (state final))))

(defrule up ""

   (logical (wealth Rich))

   =>

   (assert (UI-state (display Up)
                     (state final))))

(defrule raising ""

   (logical (wealth Poor))

   =>

   (assert (UI-state (display Raising)
                     (state final))))

(defrule new ""

   (logical (adorkable Adorkable))

   =>

   (assert (UI-state (display New)
                     (state final))))

(defrule girls ""

   (logical (adorkable No))

   =>

   (assert (UI-state (display Girls)
                     (state final))))

(defrule empire ""

   (logical (shot EverySoOften))

   =>

   (assert (UI-state (display Empire)
                     (state final))))

(defrule justified ""

   (logical (shot ShootingAllTheTime))

   =>

   (assert (UI-state (display Justified)
                     (state final))))

(defrule madmen ""

   (logical (cars Luxurious))

   =>

   (assert (UI-state (display MadMen)
                     (state final))))

(defrule gothrones ""

   (logical (cars Horses))

   =>

   (assert (UI-state (display GoT)
                     (state final))))

(defrule parks ""

   (logical (spy No))

   =>

   (assert (UI-state (display Parks)
                     (state final))))

(defrule homeland ""

   (logical (spy NotAtLiberty))

   =>

   (assert (UI-state (display Homeland)
                     (state final))))

(defrule archer ""

   (logical (spy Danger))

   =>

   (assert (UI-state (display Archer)
                     (state final))))

(defrule parenthood ""

   (logical (sing NoGod))

   =>

   (assert (UI-state (display Parenthood)
                     (state final))))

(defrule league ""

   (logical (fantasy Fantasy))

   =>

   (assert (UI-state (display League)
                     (state final))))

(defrule east ""

   (logical (fantasy Real))

   =>

   (assert (UI-state (display East)
                     (state final))))

(defrule smash ""

   (logical (covers Originals))

   =>

   (assert (UI-state (display Smash)
                     (state final))))

(defrule glee ""

   (logical (covers Covers))

   =>

   (assert (UI-state (display Glee)
                     (state final))))

(defrule horror ""

   (logical (haunted Everything))

   =>

   (assert (UI-state (display Horror)
                     (state final))))

(defrule bb ""

   (logical (haunted Soul))

   =>

   (assert (UI-state (display BB)
                     (state final))))

(defrule broke ""

   (logical (cupcakes YouKnowIt))

   =>

   (assert (UI-state (display 2BG)
                     (state final))))

(defrule apt ""

   (logical (cupcakes James))

   =>

   (assert (UI-state (display Apt)
                     (state final))))

(defrule happy ""

   (logical (cupcakes Amazing))

   =>

   (assert (UI-state (display Happy)
                     (state final))))

(defrule modern ""

   (logical (mother Weird))

   =>

   (assert (UI-state (display Modern)
                     (state final))))

(defrule how-mother ""

   (logical (mother NoComeOn))

   =>

   (assert (UI-state (display Mother)
                     (state final))))

(defrule portlandia ""

   (logical (hipsters YesNetflix))

   =>

   (assert (UI-state (display Portlandia)
                     (state final))))

(defrule key ""

   (logical (hipsters No))

   =>

   (assert (UI-state (display Key)
                     (state final))))

(defrule workaholics ""

   (logical (weed Bewrl))

   =>

   (assert (UI-state (display Workaholics)
                     (state final))))

(defrule grimm ""

   (logical (weed No))

   =>

   (assert (UI-state (display Grimm)
                     (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
