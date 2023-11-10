/*
  Warnings:

  - You are about to drop the column `exercise_log_id` on the `Exercise` table. All the data in the column will be lost.
  - You are about to drop the column `is_complited` on the `Exercise_log` table. All the data in the column will be lost.
  - You are about to drop the column `is_complited` on the `Exercise_time` table. All the data in the column will be lost.
  - You are about to drop the column `is_complited` on the `Workout_log` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Exercise" DROP CONSTRAINT "Exercise_exercise_log_id_fkey";

-- AlterTable
ALTER TABLE "Exercise" DROP COLUMN "exercise_log_id";

-- AlterTable
ALTER TABLE "Exercise_log" DROP COLUMN "is_complited",
ADD COLUMN     "exercise_id" INTEGER,
ADD COLUMN     "is_completed" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Exercise_time" DROP COLUMN "is_complited",
ADD COLUMN     "is_completed" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Workout_log" DROP COLUMN "is_complited",
ADD COLUMN     "is_completed" BOOLEAN NOT NULL DEFAULT false;

-- AddForeignKey
ALTER TABLE "Exercise_log" ADD CONSTRAINT "Exercise_log_exercise_id_fkey" FOREIGN KEY ("exercise_id") REFERENCES "Exercise"("id") ON DELETE SET NULL ON UPDATE CASCADE;
