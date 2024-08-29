/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "EmailStatus" AS ENUM ('SENT', 'FAILED');

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_created_by_fkey";

-- DropTable
DROP TABLE "user";

-- DropEnum
DROP TYPE "Role";

-- CreateTable
CREATE TABLE "Email" (
    "id" TEXT NOT NULL,
    "to" VARCHAR(255) NOT NULL,
    "from" VARCHAR(255) NOT NULL,
    "subject" VARCHAR(255) NOT NULL,
    "text" TEXT NOT NULL,
    "status" "EmailStatus" NOT NULL DEFAULT 'SENT',
    "message_id" VARCHAR(255),
    "error_message" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Email_pkey" PRIMARY KEY ("id")
);
