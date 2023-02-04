-- ok, testing some component stuff with lua

entity_id = GetUpdatedEntityID()

EntitySetTransform( entity_id, 100 + math.random() * 100, 100 + math.random() * 100, math.random() * 0, 2.0, 0.5 )