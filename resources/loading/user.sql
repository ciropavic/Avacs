USE `irspring`;

ALTER TABLE `users`
  ADD COLUMN `firstname` VARCHAR(50) NULL DEFAULT '',
  ADD COLUMN `lastname` VARCHAR(50) NULL DEFAULT ''
;